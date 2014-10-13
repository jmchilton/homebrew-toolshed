require 'formula'

class ModencodedccBamedit < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/modencode-dcc/bamedit
  # Tool Shed Readme:
  #    Compiling SAMtools requires the ncurses and zlib development libraries.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://data.modencode.org/modENCODE_Galaxy/tarballs/samtoolspkg.tar"
  sha1 ""
  
  def install
    system "chmod ago+x samtools" 
    system "chmod ago+x maq2sam-long" 
    bin.install "samtools"
    bin.install "maq2sam-long"
    # Tool Shed set environment variable that is picked implicitly.
  end
end