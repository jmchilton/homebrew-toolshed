require 'formula'

class NileshTabix < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/nilesh/tabix
  # Tool Shed Readme:
  #    
  #            	Tabix version 0.2.6. Tabix was written by Heng Li. The BGZF library was originally implemented by Bob Handsaker and modified by Heng Li for remote file access and in-memory caching.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://sourceforge.net/projects/samtools/files/tabix/tabix-0.2.6.tar.bz2"
  sha1 ""
  
  def install
    system "make" 
    bin.install "tabix"
    bin.install "bgzip"
    # Tool Shed set environment variable that is picked implicitly.
  end
end