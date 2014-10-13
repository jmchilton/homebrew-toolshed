require 'formula'

class IucPackageinfernal11 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_infernal_1_1
  # Tool Shed Readme:
  #    
  #                Infernal is designed to run on POSIX-compatible platforms, including
  #                UNIX, Linux and MacOS/X. http://infernal.janelia.org/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://selab.janelia.org/pub/software/infernal/infernal-1.1.tar.gz"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix}" 
    system "make" 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end