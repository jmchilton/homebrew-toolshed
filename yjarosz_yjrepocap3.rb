require 'formula'

class YjaroszYjrepocap3 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/yjarosz/yjrepo
  # Tool Shed Readme:
  #    
  #                Download, extract, compile and put cap3 in the PATH
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://seq.cs.iastate.edu/CAP3/cap3.linux.x86_64.tar"
  sha1 ""
  
  def install
    bin.install "cap3"
    # Tool Shed set environment variable that is picked implicitly.
  end
end