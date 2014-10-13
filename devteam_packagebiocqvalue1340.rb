require 'formula'
require 'json'

class DevteamPackagebiocqvalue1340 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_bioc_qvalue_1_34_0
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://bioconductor.org/packages/2.12/bioc/src/contrib/qvalue_1.34.0.tar.gz", :using => :nounzip
  sha1 ""
  
  depends_on "jmchilton/toolshed/devteam_packager2110"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "export R_LIBS=#{prefix} && R CMD INSTALL qvalue_1.34.0.tar.gz" 
    environment([{'action'=> 'prepend', 'variable'=> 'R_LIBS', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end