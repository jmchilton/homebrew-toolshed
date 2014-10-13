require 'formula'

class MillerlabPackagegdctools01 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/miller-lab/package_gd_c_tools_0_1
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.bx.psu.edu/miller_lab/dist/gd_c_tools.0.1.1.tar.gz"
  sha1 ""
  
  def install
    system "make install" 
    system "cp -R bin #{prefix}" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end