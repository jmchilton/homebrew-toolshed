require 'formula'
require 'json'

class BorisPackageape30 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/boris/package_ape_3_0
  # Tool Shed Readme:
  #     ape provides functions for reading, writing, plotting, and manipulating phylogenetic trees
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://cran.at.r-project.org/src/contrib/Archive/ape/ape_3.0-8.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/boris_packager2150"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "mkdir", "-p", "#{prefix}"
    system " export PATH=$PATH && export R_HOME=$R_HOME && export R_LIBS=$R_LIBS && R CMD INSTALL . -l #{prefix} " 
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$ENV[PATH]'},{'action'=> 'prepend', 'variable'=> 'R_HOME', 'value'=> '$ENV[R_HOME]'},{'action'=> 'prepend', 'variable'=> 'R_LIBS', 'value'=> '$ENV[R_LIBS]'},{'action'=> 'prepend', 'variable'=> 'R_LIBS', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end