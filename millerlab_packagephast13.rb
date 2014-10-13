require 'formula'

class MillerlabPackagephast13 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/miller-lab/package_phast_1_3
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://compgen.bscb.cornell.edu/phast/downloads/phast.v1_3.tgz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/millerlab_packageclapack321"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    cd 'src'
    system "make" 
    cd '..'
    system "cp -R bin #{prefix}" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end