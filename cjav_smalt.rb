require 'formula'

class CjavSmalt < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/cjav/smalt
  # Tool Shed Readme:
  #    
  #    Upstream authors only provide binaries so far. This tool dependency definition will install both Linux binaries(i686/x86_64) and the wrapper will try to use the right one by using 'smalt_`uname -i`'.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://ftp.sanger.ac.uk/pub4/resources/software/smalt/smalt-0.7.3.tgz"
  sha1 ""
  
  def install
    bin.install "smalt_x86_64"
    bin.install "smalt_i686"
    # Tool Shed set environment variable that is picked implicitly.
  end
end