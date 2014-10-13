require 'formula'

class JeremieDelly < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/jeremie/delly_
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/tobiasrausch/delly/releases/download/v0.5.5/delly_v0.5.5_linux_x86_64bit"
  sha1 ""
  
  def install
  end
end