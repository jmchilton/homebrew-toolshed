require 'formula'

class GeertvandeweyerPackageigvtools2332 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/geert-vandeweyer/package_igvtools_2_3_32
  # Tool Shed Readme:
  #    
  #            	
  #    	
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.broadinstitute.org/igv/projects/downloads/igvtools_2.3.32.zip"
  sha1 ""
  
  def install
    bin.install Dir["./*"]
    system "chmod u+x #{prefix}/bin/igvtools" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end