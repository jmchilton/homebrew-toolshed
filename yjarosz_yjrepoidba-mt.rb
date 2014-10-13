require 'formula'

class YjaroszYjrepoidba-mt < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/yjarosz/yjrepo
  # Tool Shed Readme:
  #    
  #                Download, extract, compile and put idba-mt in the PATH
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://hku-idba-mt.googlecode.com/svn/branches/idba_mtp_v1.0.zip"
  sha1 ""
  
  def install
    system "make" 
    bin.install "idba-mt"
    # Tool Shed set environment variable that is picked implicitly.
  end
end