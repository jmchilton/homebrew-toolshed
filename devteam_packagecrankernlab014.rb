require 'formula'
require 'json'

class DevteamPackagecrankernlab014 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_cran_kernlab_0_1_4
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://cran.r-project.org/src/contrib/Archive/kernlab/kernlab_0.1-4.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/devteam_packager2110"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "export R_LIBS=#{prefix} ; R CMD INSTALL ." 
    environment([{'action'=> 'prepend', 'variable'=> 'R_LIBS', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end