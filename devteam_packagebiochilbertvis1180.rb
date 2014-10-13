require 'formula'
require 'json'

class DevteamPackagebiochilbertvis1180 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_bioc_hilbertvis_1_18_0
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://bioconductor.org/packages/2.12/bioc/src/contrib/HilbertVis_1.18.0.tar.gz", :using => :nounzip
  sha1 ""
  
  depends_on "jmchilton/toolshed/devteam_packager2110"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "export R_LIBS_USER=#{prefix} && R CMD INSTALL HilbertVis_1.18.0.tar.gz" 
    environment([{'action'=> 'prepend', 'variable'=> 'R_LIBS_USER', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end