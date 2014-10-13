require 'formula'

class RnateamBlockbuster < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/rnateam/blockbuster
  # Tool Shed Readme:
  #    
  #            Blockbuster detects blocks of overlapping reads using a gaussian-distribution approach.
  #            GCC is needed to compilte Blockbuster.
  #            http://hoffmann.bioinf.uni-leipzig.de/LIFE/blockbuster.html
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/bgruening/download_store/raw/master/blockbuster/blockbuster-0.0.1.tar.gz"
  sha1 ""
  
  def install
    system "make" 
    bin.install "blockbuster.x"
    # Tool Shed set environment variable that is picked implicitly.
  end
end