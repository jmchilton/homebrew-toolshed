require 'formula'

class DevteamPackagermap205 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_rmap_2_05
  # Tool Shed Readme:
  #    
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/x86_64/rmap/rmap-2.05-Linux-x86_64.tgz"
    sha1 ""
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/x86_64/rmap/rmap-2.05-darwin-x86_64.tgz"
    sha1 ""
  else
    url "http://www.cmb.usc.edu/people/andrewds/rmap/rmap_v2.05.tbz2"
    sha1 ""
  end
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  else
  end
  def install
    if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    else
      system "make install" 
      prefix.install "gpl-3.0.txt"
      prefix.install "README.txt"
      bin.install Dir["bin/*"]
      # Tool Shed set environment variable that is picked implicitly.
    end
  end
end