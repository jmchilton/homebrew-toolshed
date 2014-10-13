require 'formula'

class GuerlerCharts < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/guerler/charts
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  depends_on "jmchilton/toolshed/iuc_packager303"
  def install
    onoe("Unhandled tool shed action R encountered.")
  end
end