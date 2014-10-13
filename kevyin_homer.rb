require 'formula'

class KevyinHomer < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/kevyin/homer
  # Tool Shed Readme:
  #    
  #          I'm sorry but this does not work
  #          
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://biowhat.ucsd.edu/homer/configureHomer.pl"
  sha1 ""
  
  def install
    system "perl ./configureHomer.pl -install" 
    prefix.install Dir[".//*"]
    # Tool Shed set environment variable that is picked implicitly.
  end
end