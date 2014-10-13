require 'formula'

class GalaxypPackagepeptidestogff01 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/galaxyp/package_peptides_to_gff_0_1
  # Tool Shed Readme:
  #    
  #              Sets up a virtualenv for peptides-to-gff.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  def install
    system "hg clone https://bitbucket.org/galaxyp-applications/peptide-to-gff peptide_to_gff" 
    system "hg update -d 2014-09-08" 
    bin.install "peptide_to_gff"
    # Tool Shed set environment variable that is picked implicitly.
  end
end