require 'formula'

class RnateamRnabob < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/rnateam/rnabob
  # Tool Shed Readme:
  #    
  #    Compiling rnabob requires a C compiler (typically gcc)
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://selab.janelia.org/software/rnabob/rnabob.tar.gz"
  sha1 ""
  
  def install
    system "make" 
    bin.install "rnabob"
    # Tool Shed set environment variable that is picked implicitly.
  end
end