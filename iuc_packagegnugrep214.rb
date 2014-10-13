require 'formula'

class IucPackagegnugrep214 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_gnu_grep_2_14
  # Tool Shed Readme:
  #    
  #                Compiling GNU grep requires a C compiler. http://www.gnu.org/software/grep/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/bgruening/download_store/raw/master/GNU/grep-2.14.tar.bz2"
  sha1 ""
  
  def install
    system "./configure --enable-perl-regexp --prefix=#{prefix}" 
    system "make" 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end