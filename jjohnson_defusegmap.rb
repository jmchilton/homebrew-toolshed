require 'formula'

class JjohnsonDefusegmap < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/jjohnson/defuse
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://research-pub.gene.com/gmap/src/gmap-gsnap-2012-07-20.v2.tar.gz"
  sha1 ""
  
  def install
    system "./configure" 
    system "make" 
    bin.install "src/gmap"
    bin.install "src/gmapindex"
    bin.install "src/gsnap"
    bin.install "src/uniqscan"
    bin.install "src/iit_store"
    bin.install "src/iit_get"
    bin.install "src/atoiindex"
    bin.install "src/snpindex"
    bin.install "src/cmetindex"
    bin.install "src/get-genome"
    bin.install Dir["util/*"]
    # Tool Shed set environment variable that is picked implicitly.
  end
end