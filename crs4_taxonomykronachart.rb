require 'formula'

class Crs4Taxonomykronachart < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/crs4/taxonomy_krona_chart
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/krona/KronaTools%20%28Mac%2C%20Linux%29/KronaTools-2.4.tar"
  sha1 ""
  
  def install
    prefix.install Dir["./*"]
    system "cd #{prefix} && ./install.pl --prefix=#{prefix}" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end