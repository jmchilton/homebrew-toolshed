require 'formula'

class YjaroszYjrepotrimmomatic < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/yjarosz/yjrepo
  # Tool Shed Readme:
  #    
  #                Download, extract, compile and put trimmomatic in the PATH
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-Src-0.32.zip"
  sha1 ""
  
  def install
    system "ant" 
    system "mkdir", "-p", "#{prefix}/tool-data"
    mv "dist/jar/trimmomatic-0.32.jar", "#{prefix}/tool-data"
    # Tool Shed set environment variable that is picked implicitly.
  end
end