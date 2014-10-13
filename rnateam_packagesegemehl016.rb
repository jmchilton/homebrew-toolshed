require 'formula'
require 'json'

class RnateamPackagesegemehl016 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/rnateam/package_segemehl_0_1_6
  # Tool Shed Readme:
  #    
  #                Short read mapping with gaps.
  #                To compile segemehl a C-compiler is needed, usually GCC.
  #                http://www.bioinf.uni-leipzig.de/Software/segemehl/
  #                
  #                Please note that segemehl loads the whole index and genome files into memory.
  #                Segemehl's index is around 45GB in size, so the memory usage of that tool is huge.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.bioinf.uni-leipzig.de/Software/segemehl/segemehl_0_1_6.tar.gz"
  sha1 ""
  
  def install
    cd 'segemehl'
    system "make" 
    prefix.install "segemehl.x"
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end