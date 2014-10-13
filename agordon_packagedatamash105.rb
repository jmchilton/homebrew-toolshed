require 'formula'

class AgordonPackagedatamash105 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/agordon/package_datamash_1_0_5
  # Tool Shed Readme:
  #    
  #                Compiling GNU Datamash requires a C compiler.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://ftp.gnu.org/gnu/datamash/datamash-1.0.5.tar.gz"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix} --disable-dependency-tracking" 
    system "make" 
    system "make check" 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end