require 'formula'

class YjaroszYjrepofastuniq < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/yjarosz/yjrepo
  # Tool Shed Readme:
  #    
  #                Download, extract, compile and put fastuniq in the PATH
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/fastuniq/FastUniq-1.1.tar.gz"
  sha1 ""
  
  def install
    system "make install"
    bin.install "fastuniq"
    # Tool Shed set environment variable that is picked implicitly.
  end
end