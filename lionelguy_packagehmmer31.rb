require 'formula'

class LionelguyPackagehmmer31 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/lionelguy/package_hmmer_3_1
  # Tool Shed Readme:
  #    
  #    This installs hmmer 3.1b1. See http://hmmer.janelia.org/ for more details.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://selab.janelia.org/software/hmmer3/3.1b1/hmmer-3.1b1.tar.gz"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix}" 
    system "make" 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end