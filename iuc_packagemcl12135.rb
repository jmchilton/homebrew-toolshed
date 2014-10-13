require 'formula'

class IucPackagemcl12135 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_mcl_12_135
  # Tool Shed Readme:
  #    
  #            The MCL algorithm is short for the Markov Cluster Algorithm, a fast and scalable unsupervised cluster algorithm for graphs (also known as networks) based on simulation of (stochastic) flow in graphs.
  #            http://micans.org/mcl/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://micans.org/mcl/src/mcl-12-135.tar.gz"
  sha1 ""
  
  def install
    system "
                    ./configure --prefix=#{prefix}
                " 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end