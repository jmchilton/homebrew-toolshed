require 'formula'

class CjavPackagengstools018 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/cjav/package_ngs_tools_0_1_8
  # Tool Shed Readme:
  #    
  #    This Galaxy Tool Shed package installs ngs-tools. This requires and assumes a
  #    standard C compiler is already installed, along with the Python header files.
  #    
  #    Development of this dependency definition is being done here on GitHub:
  #    https://github.com/cjav/ngs-tools/tree/master/galaxy-tools
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  def install
  end
end