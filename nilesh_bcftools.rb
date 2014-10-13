require 'formula'

class NileshBcftools < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/nilesh/bcftools
  # Tool Shed Readme:
  #    Both BCFTools and Samtools installed in this dependency.Compiling SAMtools requires the ncurses and zlib development libraries.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://sourceforge.net/projects/samtools/files/samtools/0.1.19/samtools-0.1.19.tar.bz2"
  sha1 ""
  
  def install
    system "make" 
    bin.install "samtools"
    bin.install "bcftools/bcftools"
    # Tool Shed set environment variable that is picked implicitly.
  end
end