require 'formula'

class NileshSickle < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/nilesh/sickle
  # Tool Shed Readme:
  #    
  #                Sickle requires a C compiler; GCC or clang are recommended. Sickle relies on Heng Li's kseq.h, which is bundled with the source. It also requires zlib, which is included in this repo.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://zlib.net/zlib-1.2.8.tar.gz"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix}/zlib" 
    system "make" 
    system "make install prefix=#{prefix}/zlib" 
    system "git clone https://github.com/najoshi/sickle.git" 
    system "cd ./sickle && make LIBS=\"-L#{prefix}/zlib/lib -lz\"" 
    bin.install "sickle/sickle"
    # Tool Shed set environment variable that is picked implicitly.
  end
end