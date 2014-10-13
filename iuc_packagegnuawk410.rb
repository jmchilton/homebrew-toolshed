require 'formula'

class IucPackagegnuawk410 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_gnu_awk_4_1_0
  # Tool Shed Readme:
  #    
  #                Compiling GNU awk requires a C compiler. http://www.gnu.org/software/gawk/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://ftp.gnu.org/gnu/gawk/gawk-4.1.0.tar.gz"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix}" 
    system "make" 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end