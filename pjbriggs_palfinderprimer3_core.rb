require 'formula'

class PjbriggsPalfinderprimer3Core < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/pjbriggs/pal_finder
  # Tool Shed Readme:
  #    primer3_core
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://sourceforge.net/projects/primer3/files/primer3/2.0.0-alpha/primer3-2.0.0-alpha.tar.gz"
  sha1 ""
  
  def install
    system "make -C src -f Makefile" 
    bin.install "src/primer3_core"
    # Tool Shed set environment variable that is picked implicitly.
  end
end