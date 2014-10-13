require 'formula'

class SimongladmanBarrnap < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/simon-gladman/barrnap
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.vicbioinformatics.com/barrnap-0.1.tar.gz"
  sha1 ""
  
  def install
    bin.install Dir["./*"]
    # Tool Shed set environment variable that is picked implicitly.
    system "chmod ugo+x #{prefix}/bin/barrnap" 
  end
end