require 'formula'
require 'json'

class DevteamPackagemacs1371 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_macs_1_3_7_1
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://depot.galaxyproject.org/package/source/MACS-1.3.7.1.tar.gz"
  sha1 ""
  
  def install
    system "export PYTHONPATH=#{prefix}/lib/python && python setup.py install --prefix #{prefix} --install-lib #{prefix}/lib/python" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python/site-packages'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end