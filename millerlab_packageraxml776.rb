require 'formula'

class MillerlabPackageraxml776 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/miller-lab/package_raxml_7_7_6
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/stamatak/standard-RAxML/archive/v7.7.6.tar.gz"
  sha1 ""
  
  def install
    system "make -f Makefile.gcc" 
    system "mkdir -p #{prefix}/bin" 
    system "cp raxmlHPC #{prefix}/bin" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end