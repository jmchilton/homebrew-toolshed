require 'formula'

class AntonPackagebamtools < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/anton/package_bamtools
  # Tool Shed Readme:
  #    
  #    Binary files in this package are compiled from source code version 2d7685d2ae
  #    This is package dependency for tools relying on bamtools toolkit developed by by Derek Barnett (https://github.com/pezmaster31/bamtools). This package is distributed as x86_64 binaries only. These binaries should work on any of our stated supported linux platforms other than RHEL/CentOS 5.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://depot.galaxyproject.org/package/linux/x86_64/bamtools/bamtools-2.3.0_2d7685d2ae.tar.gz"
  sha1 ""
  
  def install
    prefix.install Dir["./*"]
    # Tool Shed set environment variable that is picked implicitly.
  end
end