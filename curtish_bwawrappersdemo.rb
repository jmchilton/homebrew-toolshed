require 'formula'

class CurtishBwawrappersdemo < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/curtish/bwa_wrappers_demo
  # Tool Shed Readme:
  #    
  #    Compiling BWA requires zlib and libpthread to be present on your system.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/bio-bwa/bwa-0.5.9.tar.bz2"
  sha1 ""
  
  def install
    system "make" 
    bin.install "bwa"
    # Tool Shed set environment variable that is picked implicitly.
  end
end