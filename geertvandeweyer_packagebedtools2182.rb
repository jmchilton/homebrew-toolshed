require 'formula'

class GeertvandeweyerPackagebedtools2182 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/geert-vandeweyer/package_bedtools_2_18_2
  # Tool Shed Readme:
  #    
  #    		Collectively, the bedtools utilities are a swiss-army knife of tools for a wide-range of genomics analysis tasks. The most widely-used tools enable genome arithmetic: that is, set theory on the genome. For example, bedtools allows one to intersect, merge, count, complement, and shuffle genomic intervals from multiple files in widely-used genomic file formats such as BAM, BED, GFF/GTF, VCF.
  #         	
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/arq5x/bedtools2/archive/v2.18.2.tar.gz"
  sha1 ""
  
  def install
    system "make" 
    bin.install "bin/"
    # Tool Shed set environment variable that is picked implicitly.
  end
end