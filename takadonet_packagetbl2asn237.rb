require 'formula'

class TakadonetPackagetbl2asn237 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/takadonet/package_tbl2asn_23_7
  # Tool Shed Readme:
  #    tbl2asn is originally hosted on ftp://ftp.ncbi.nih.gov/toolbox/ncbi_tools/converters/by_program/tbl2asn/ and mirrored to bgruening's github account to enable reproducibility.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  def install
    onoe("Unhandled tool shed action [download_binary] encountered.")
    # Tool Shed set environment variable that is picked implicitly.
  end
end