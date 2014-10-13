require 'formula'

class NileshFastqvalidator < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/nilesh/fastqvalidator
  # Tool Shed Readme:
  #    
  #               View the FastQ Validator overview at http://genome.sph.umich.edu/wiki/FastQValidator.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "
                    http://genome.sph.umich.edu/w/images/2/20/FastQValidatorLibStatGen.0.1.1a.tgz
                "
  sha1 ""
  
  def install
    system "make all" 
    prefix.install "fastQValidator/bin"
    # Tool Shed set environment variable that is picked implicitly.
  end
end