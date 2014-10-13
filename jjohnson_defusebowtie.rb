require 'formula'

class JjohnsonDefusebowtie < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/jjohnson/defuse
  # Tool Shed Readme:
  #    
  #                Compiling Bowtie requires libpthread to be present on your system.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/bowtie-bio/bowtie/0.12.7/bowtie-0.12.7-src.zip"
  sha1 ""
  
  def install
    system "make" 
    bin.install "bowtie"
    bin.install "bowtie-build"
    bin.install "bowtie-inspect"
    # Tool Shed set environment variable that is picked implicitly.
  end
end