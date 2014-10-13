require 'formula'

class ModencodedccPeakranger < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/modencode-dcc/peakranger
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://data.modencode.org/modENCODE_Galaxy/tarballs/peakranger.tar?raw=true"
  sha1 ""
  
  def install
    system "chmod ago+x peakranger" 
    bin.install "peakranger"
    # Tool Shed set environment variable that is picked implicitly.
  end
end