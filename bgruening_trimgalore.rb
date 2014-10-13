require 'formula'

class BgrueningTrimgalore < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/bgruening/trim_galore
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://cutadapt.googlecode.com/files/cutadapt-1.1.tar.gz"
  sha1 ""
  
  def install
    bin.install Dir["bin/*"]
    system "mkdir", "-p", "#{prefix}/cutadapt"
    mv Dir["cutadapt/*"], "#{prefix}/cutadapt" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end