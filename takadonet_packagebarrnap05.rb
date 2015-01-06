require 'formula'

class TakadonetPackagebarrnap05 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/takadonet/package_barrnap_0_5
  # Tool Shed Readme:
  #    
  #    Dependencies of Barrnap which needs to be installed separately:
  #    - Perl core modules: FindBin, Time::Piece.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.vicbioinformatics.com/barrnap-0.5.tar.gz"
  sha1 ""
  
  def install
    prefix.install Dir["./*"]
    # Tool Shed set environment variable that is picked implicitly.
  end
end