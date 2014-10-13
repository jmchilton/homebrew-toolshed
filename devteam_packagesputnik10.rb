require 'formula'

class DevteamPackagesputnik10 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_sputnik_1_0
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/x86_64/sputnik/sputnik-1.0-Darwin-x86_64.tgz"
    sha1 ""
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/x86_64/sputnik/sputnik-1.0-Linux-x86_64.tgz"
    sha1 ""
  else
    url "https://bitbucket.org/natefoo/sputnik-mononucleotide/get/22e04543ccf3.zip"
    sha1 ""
  end
  
  if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  else
  end
  def install
    if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    else
      system "make" 
      system "mkdir", "-p", "#{prefix}/bin/sputnik"
      mv "sputnik", "#{prefix}/bin/sputnik"
      # Tool Shed set environment variable that is picked implicitly.
    end
  end
end