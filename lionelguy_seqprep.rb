require 'formula'

class LionelguySeqprep < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/lionelguy/seqprep
  # Tool Shed Readme:
  #    
  #    SeqPrep is copyrighted (2011) to John St. John. 
  #    Downloading from https://github.com/jstjohn/SeqPrep
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  def install
    system "git clone --recursive git://github.com/jstjohn/SeqPrep.git" 
    system "git reset --hard 11301c4a5f3222bdb4d0ec30ae5e192e609c0154" 
    system "make" 
    system "mkdir", "-p", "#{prefix}/bin"
    bin.install "SeqPrep"
    bin.install "Test/seqlens.py"
    # Tool Shed set environment variable that is picked implicitly.
  end
end