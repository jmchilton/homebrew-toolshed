require 'formula'

class DevteamPackageclustalw21 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_clustalw_2_1
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.clustal.org/download/current/clustalw-2.1.tar.gz"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix}" 
    system "make && make install" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end