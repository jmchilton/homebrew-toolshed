require 'formula'

class MillerlabPackagequicktree11 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/miller-lab/package_quicktree_1_1
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://ftp.sanger.ac.uk/pub4/resources/software/quicktree/quicktree.tar.gz"
  sha1 ""
  
  def install
    system "make quicktree" 
    system "cp -R bin #{prefix}" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end