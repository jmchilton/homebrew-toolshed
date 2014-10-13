require 'formula'

class IucPackagebowtie100 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_bowtie_1_0_0
  # Tool Shed Readme:
  #    
  #    Compiling Bowtie requires libpthread to be present on your system.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/bowtie-bio/bowtie/1.0.0/bowtie-1.0.0-src.zip"
  sha1 ""
  
  def install
    system "make" 
    bin.install "bowtie"
    bin.install "bowtie-build"
    bin.install "bowtie-inspect"
    # Tool Shed set environment variable that is picked implicitly.
  end
end