require 'formula'

class BgrueningRnaz < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/bgruening/rnaz
  # Tool Shed Readme:
  #    Compiling RNAz requires a C compiler (typically gcc)
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.tbi.univie.ac.at/~wash/RNAz/RNAz-2.1.tar.gz"
  sha1 ""
  
  def install
    onoe("Unhandled tool shed action [autoconf] encountered.")
    # Tool Shed set environment variable that is picked implicitly.
  end
end