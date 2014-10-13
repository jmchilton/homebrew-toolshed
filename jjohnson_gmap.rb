require 'formula'

class JjohnsonGmap < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/jjohnson/gmap
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  def install
    system "wget http://research-pub.gene.com/gmap/src/gmap-gsnap-2011-11-30.tar.gz" 
    system " ./configure --prefix=bin --with-gmapdb=../gmapdb" 
    system "make" 
    bin.install Dir["bin/*"]
    # Tool Shed set environment variable that is picked implicitly.
  end
end