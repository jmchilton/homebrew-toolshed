require 'formula'
require 'json'

class IucPackageprodigal260 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_prodigal_2_60
  # Tool Shed Readme:
  #    
  #    This installs Prodigal 2.60.
  #    
  #    See home page: http://prodigal.ornl.gov/
  #    See code: http://code.google.com/p/prodigal/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://prodigal.googlecode.com/files/Prodigal-2.60.tar.gz"
  sha1 ""
  
  def install
    system "make" 
    prefix.install "prodigal"
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end