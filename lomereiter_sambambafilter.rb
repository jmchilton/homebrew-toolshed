require 'formula'

class LomereiterSambambafilter < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/lomereiter/sambamba_filter
  # Tool Shed Readme:
  #    
  #          Downloads the precompiled 64bit Linux or Mac OS X binaries from the official repository 'Releases' section.
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.mac? and Hardware.is_64_bit?
    url "
            https://github.com/lomereiter/sambamba/releases/download/v0.4.7/sambamba_v0.4.7_osx.tar.bz2
          "
    sha1 ""
  elsif OS.linux? and Hardware.is_64_bit?
    url "
            https://github.com/lomereiter/sambamba/releases/download/v0.4.7/sambamba_v0.4.7_centos5.tar.bz2
          "
    sha1 ""
  end
  
  if OS.mac? and Hardware.is_64_bit?
  elsif OS.linux? and Hardware.is_64_bit?
  end
  def install
    if OS.mac? and Hardware.is_64_bit?
      bin.install "sambamba_v0.4.7"
      # Tool Shed set environment variable that is picked implicitly.
    elsif OS.linux? and Hardware.is_64_bit?
      bin.install "sambamba_v0.4.7"
      # Tool Shed set environment variable that is picked implicitly.
    end
  end
end