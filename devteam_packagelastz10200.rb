require 'formula'

class DevteamPackagelastz10200 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_lastz_1_02_00
  # Tool Shed Readme:
  #    
  #    LASTZ is a program for aligning DNA sequences, a pairwise aligner. Originally designed to handle sequences the size of human chromosomes and from different species, it is also useful for sequences produced by NGS sequencing technologies such as Roche 454.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/x86_64/lastz/lastz-1.02.00-Linux-x86_64.tgz"
    sha1 ""
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/x86_64/lastz/lastz-1.02.00-Darwin-x86_64.tgz"
    sha1 ""
  else
    url "http://www.bx.psu.edu/miller_lab/dist/lastz-1.02.00.tar.gz"
    sha1 ""
  end
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  else
  end
  def install
    if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      bin.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      bin.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    else
      system "make" 
      bin.install "src/lastz"
      bin.install "src/lastz_D"
      # Tool Shed set environment variable that is picked implicitly.
    end
  end
end