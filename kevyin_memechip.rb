require 'formula'

class KevyinMemechip < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/kevyin/meme_chip
  # Tool Shed Readme:
  #    
  #          Skeleton file for meme install. Does not actually install meme.
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://ftp.ebi.edu.au/pub/software/MEME/r4.9.0/rc5/meme_4.9.0.tar.gz"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix}" 
    system "make" 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end