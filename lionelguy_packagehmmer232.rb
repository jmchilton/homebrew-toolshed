require 'formula'

class LionelguyPackagehmmer232 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/lionelguy/package_hmmer_2_3_2
  # Tool Shed Readme:
  #    
  #    This installs hmmer 2.3.2, the last stable version of the 2.x branch.
  #    See http://hmmer.janelia.org/ for more details. Compiled with --enable-threads for compatibility with rnammer.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://selab.janelia.org/software/hmmer/2.3.2/hmmer-2.3.2.tar.gz"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix} --enable-threads" 
    system "make" 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end