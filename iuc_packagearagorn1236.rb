require 'formula'

class IucPackagearagorn1236 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_aragorn_1_2_36
  # Tool Shed Readme:
  #    Compiling ARAGORN requires gcc.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://mbio-serv2.mbioekol.lu.se/ARAGORN/Downloads/aragorn1.2.36.tgz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/bin/"
    system "gcc -O3 -ffast-math -finline-functions -o aragorn aragorn1.2.36.c" 
    bin.install "aragorn"
    # Tool Shed set environment variable that is picked implicitly.
  end
end