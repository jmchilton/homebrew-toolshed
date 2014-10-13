require 'formula'
require 'json'

class IucPackagepysam077 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_pysam_0_7_7
  # Tool Shed Readme:
  #    
  #                Installation of pysam, pyrex and python are required. The installation can be accessed via PYSAM_PATH.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://pypi.python.org/packages/source/p/pysam/pysam-0.7.7.tar.gz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/lib/python"
    system "export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python && python setup.py install --install-lib #{prefix}/lib/python --install-scripts #{prefix}/bin" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'set', 'variable'=> 'PYSAM_PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end