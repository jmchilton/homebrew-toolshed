require 'formula'

class BgrueningSpectralhk < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/bgruening/spectral_hk
  # Tool Shed Readme:
  #    Compiling spectral_hk requires a C compiler (typically gcc)
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  def install
    system "git clone https://bitbucket.org/ncgc/spectral_hk.git" 
    system "git reset --hard 4c2d2f36708798bbe49a4633df246fa065e2268a" 
    system "make" 
    bin.install "spectral_hk"
    # Tool Shed set environment variable that is picked implicitly.
  end
end