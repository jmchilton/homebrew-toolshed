require 'formula'
require 'json'

class IucPackagecython0201 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_cython_0_20_1
  # Tool Shed Readme:
  #    
  #                Installation of cython requieres python. The installation can be accessed via CYTHON_PATH.
  #                http://cython.org
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://cython.org/release/Cython-0.20.1.tar.gz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/lib/python"
    system "mkdir", "-p", "#{prefix}/bin"
    system "export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python && python setup.py install --install-lib #{prefix}/lib/python --install-scripts #{prefix}/bin" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'set', 'variable'=> 'CYTHON_PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end