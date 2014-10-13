require 'formula'

class PavlolutsikRnbeads < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/pavlo-lutsik/rnbeads
  # Tool Shed Readme:
  #    
  #    				You need a FORTRAN compiler or perhaps f2c in addition to a C compiler to build R.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://CRAN.R-project.org/src/base/R-3/R-3.1.0.tar.gz"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix} --with-x=no" 
    system "make" 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
    system "#{prefix}/bin/R --no-save <<< \"install.packages('getopt', repos='http://cran.r-project.org'); source('http://rnbeads.mpi-inf.mpg.de/install.R')\"" 
  end
end