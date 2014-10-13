require 'formula'

class IucPackagebedtools219 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_bedtools_2_19
  # Tool Shed Readme:
  #    BEDTools is a collection of utilities for comparing, summarizing, and intersecting genomic features in BED, GTF/GFF, VCF and BAM formats.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/arq5x/bedtools2/releases/download/v2.19.1/bedtools-2.19.1.tar.gz"
  sha1 ""
  
  def install
    system "make" 
    bin.install Dir["bin/*"]
    # Tool Shed set environment variable that is picked implicitly.
  end
end