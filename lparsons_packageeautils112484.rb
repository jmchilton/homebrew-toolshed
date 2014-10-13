require 'formula'

class LparsonsPackageeautils112484 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/lparsons/package_ea_utils_1_1_2_484
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://ea-utils.googlecode.com/files/ea-utils.1.1.2-484.tar.gz"
  sha1 ""
  
  def install
    system "sed -i.bak 's/varcall$//' Makefile" 
    system "PREFIX=#{prefix} make install" 
    bin.install "sam-stats"
    # Tool Shed set environment variable that is picked implicitly.
  end
end