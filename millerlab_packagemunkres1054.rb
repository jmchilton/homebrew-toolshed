require 'formula'
require 'json'

class MillerlabPackagemunkres1054 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/miller-lab/package_munkres_1_0_5_4
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://pypi.python.org/packages/source/m/munkres/munkres-1.0.5.4.tar.gz"
  sha1 ""
  
  def install
    system "mkdir -p #{prefix}/lib/python" 
    system "PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python python setup.py install --home #{prefix}" 
    environment([{'action'=> 'append', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end