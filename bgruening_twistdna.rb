require 'formula'

class BgrueningTwistdna < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/bgruening/twistdna
  # Tool Shed Readme:
  #    Compiling TwistDNA requires a C compiler and gfortran (typically gcc)
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.cbp.ens-lyon.fr/lib/exe/fetch.php?media=developpement:productions:logiciels:twist-dna_1.1.tar.gz"
  sha1 ""
  
  def install
    system "make " 
    system "mkdir", "-p", "#{prefix}/bin"
    bin.install "TwistDNA"
    # Tool Shed set environment variable that is picked implicitly.
  end
end