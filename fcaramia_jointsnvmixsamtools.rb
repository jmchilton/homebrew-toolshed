require 'formula'

class FcaramiaJointsnvmixsamtools < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/fcaramia/jointsnvmix
  # Tool Shed Readme:
  #    
  #                Compiling SAMtools requires the ncurses and zlib development libraries.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://sourceforge.net/projects/samtools/files/samtools/0.1.18/samtools-0.1.18.tar.bz2"
  sha1 ""
  
  def install
    system "sed -i.bak -e 's/-lcurses/-lncurses/g' Makefile" 
    system "make" 
    bin.install "samtools"
    bin.install "misc/maq2sam-long"
    # Tool Shed set environment variable that is picked implicitly.
  end
end