require 'formula'

class MillerlabPackageeigensoft501 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/miller-lab/package_eigensoft_5_0_1
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.bx.psu.edu/miller_lab/redist/EIG5.0.1.tar.gz"
  sha1 ""
  
  def install
    cd 'src'
    system "make clobber" 
    system "make install" 
    cd '..'
    system "cp -R bin #{prefix}" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end