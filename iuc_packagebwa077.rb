require 'formula'

class IucPackagebwa077 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_bwa_0_7_7
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/bio-bwa/bwa-0.7.7.tar.bz2"
  sha1 ""
  
  def install
    system "make" 
    bin.install "bwa"
    # Tool Shed set environment variable that is picked implicitly.
  end
end