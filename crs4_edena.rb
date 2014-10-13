require 'formula'

class Crs4Edena < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/crs4/edena
  # Tool Shed Readme:
  #    
  #    Configuration: Previously (until Release 1), the EDENA_SITE_OPTIONS variable in the installed env.sh file was used to adjust the number of threads to use (--nThreads). This is not used anymore and may be removed.
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.genomic.ch/edena/EdenaV3.131028.tar.gz"
  sha1 ""
  
  def install
    system "make" 
    bin.install Dir["bin/*"]
    # Tool Shed set environment variable that is picked implicitly.
  end
end