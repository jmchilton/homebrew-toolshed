require 'formula'

class Crs4Glimmer < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/crs4/glimmer
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://ccb.jhu.edu/software/glimmer/glimmer302b.tar.gz"
  sha1 ""
  
  def install
    system "make -C src/" 
    system "rm -f bin/test" 
    bin.install Dir["bin/*"]
    # Tool Shed set environment variable that is picked implicitly.
  end
end