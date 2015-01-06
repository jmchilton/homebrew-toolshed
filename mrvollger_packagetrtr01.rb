require 'formula'

class MrvollgerPackagetrtr01 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/mrvollger/package_trtr_0_1
  # Tool Shed Readme:
  #    
  #    Compiling trtr requires an executable trtr to be on your system.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/mvollger/trtrR/archive/v1.0.0.tar.gz"
  sha1 ""
  
  def install
    system "make" 
    bin.install "trtr"
    # Tool Shed set environment variable that is picked implicitly.
  end
end