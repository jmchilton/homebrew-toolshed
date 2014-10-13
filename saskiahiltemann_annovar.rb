require 'formula'
require 'json'

class SaskiahiltemannAnnovar < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/saskia-hiltemann/annovar
  # Tool Shed Readme:
  #    
  #    			Downloads and installs the cgatools binary. 
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://sourceforge.net/projects/cgatools/files/1.7.1/cgatools-1.7.1.5-linux_binary-x86_64.tar.gz"
  sha1 ""
  
  def install
    system " chmod a+x bin/cgatools" 
    bin.install "bin/cgatools"
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$REPOSITORY_INSTALL_DIR'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end