require 'formula'

class IucPackagelastz10352 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_lastz_1_03_52
  # Tool Shed Readme:
  #    
  #    LASTZ is a program for aligning DNA sequences, a pairwise aligner. Originally designed to handle sequences the size of human chromosomes and from different species, it is also useful for sequences produced by NGS sequencing technologies such as Roche 454.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/x86_64/lastz/lastz-1.03.52-linux-x86_64.tgz"
    sha1 ""
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/x86_64/lastz/lastz-1.03.52-Darwin-x86_64.tgz"
    sha1 ""
  else
    url "http://www.bx.psu.edu/~rsharris/lastz/newer/lastz-1.03.52.tar.gz"
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
      system "make" 
      bin.install "src/lastz"
      bin.install "src/lastz_D"
      # Tool Shed set environment variable that is picked implicitly.
    end
  end
end