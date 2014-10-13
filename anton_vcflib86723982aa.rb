require 'formula'

class AntonVcflib86723982aa < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/anton/vcflib_86723982aa
  # Tool Shed Readme:
  #    
  #    Binary files in this package are compiled from source code with SHA: 586c5ae5d57a38dae6b32ea831fb1f7cfa14c9bd.
  #    This is package dependency for tools relying on VCFlib toolkit developed by Erik Garrison (https://github.com/ekg/vcflib). This package is distributed as x86_64 binaries only as it is difficult to compile on other platforms. These binaries should work on any of our stated supported linux platforms other than RHEL/CentOS 5.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/x86_64/vcflib/vcflib-86723982aa-Linux-x86_64.tgz"
    sha1 ""
  else
    # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
    url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
    sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  end
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  else
  end
  def install
    if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      bin.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    else
      bin.install Dir["bin/*"]
      # Tool Shed set environment variable that is picked implicitly.
    end
  end
end