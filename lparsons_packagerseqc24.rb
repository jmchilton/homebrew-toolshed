require 'formula'
require 'json'

class LparsonsPackagerseqc24 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/lparsons/package_rseqc_2_4
  # Tool Shed Readme:
  #    
  #                RSeQC version 2.4, documentation available at http://rseqc.sourceforge.net/.
  #                Requires gcc and python 2.7.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://sourceforge.net/projects/rseqc/files/RSeQC-2.4.tar.gz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/lib/python"
    system "mkdir", "-p", "#{prefix}/lib64/python"
    system "export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python && python setup.py install --install-lib #{prefix}/lib/python --install-scripts #{prefix}/bin" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end