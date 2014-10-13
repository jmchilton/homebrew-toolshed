require 'formula'

class GeertvandeweyerPackagebamtools230 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/geert-vandeweyer/package_bamtools_2_3_0
  # Tool Shed Readme:
  #    
  #            	BamTools provides both a programmer's API and an end-user's toolkit for handling BAM files. Both the BamTools API and toolkit are released under the MIT License. Copyright (c) 2009-2010 Derek Barnett, Erik Garrison, Gabor Marth, Michael Stromberg
  #    	
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/pezmaster31/bamtools/archive/v2.3.0.tar.gz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "build"
    system "cd build && cmake .. && make" 
    bin.install "bin/"
    # Tool Shed set environment variable that is picked implicitly.
  end
end