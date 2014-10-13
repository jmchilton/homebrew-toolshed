require 'formula'

class IucPackagegnuparallel20131122 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_gnu_parallel_20131122
  # Tool Shed Readme:
  #    
  #                Compiling GNU grep requires a C compiler. http://www.gnu.org/software/parallel/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://ftp.gnu.org/gnu/parallel/parallel-20131122.tar.bz2"
  sha1 ""
  
  def install
    onoe("Unhandled tool shed action [autoconf] encountered.")
    # Tool Shed set environment variable that is picked implicitly.
  end
end