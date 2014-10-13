require 'formula'

class IucPackagebarrnap02 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_barrnap_0_2
  # Tool Shed Readme:
  #    
  #    Dependencies of Barrnap which needs to be installed separately:
  #    - Perl core modules: FindBin, Time::Piece.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.vicbioinformatics.com/barrnap-0.2.tar.gz"
  sha1 ""
  
  def install
    bin.install Dir["./*"]
    # Tool Shed set environment variable that is picked implicitly.
  end
end