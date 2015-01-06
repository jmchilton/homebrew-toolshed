require 'formula'

class DevteamPackagefreebayes09180059bdf < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_freebayes_0_9_18_0059bdf
  # Tool Shed Readme:
  #    
  #    	  Starting from version freebayes-0.9.14 freebayes is distributed through ToolShed only as pre-compiled x86_64 linux binaries.
  #    	  This tarball contains two binaries:
  #    	  
  #    	  bamleftalign
  #    	  freebayes
  #    	  
  #    	  Corresponding freebayes release 0.9.18 (0059bdf)
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://depot.galaxyproject.org/package/linux/x86_64/freebayes/freebayes-0.9.18_0059bdf.tar.gz"
  sha1 ""
  
  def install
    bin.install Dir["./*"]
    # Tool Shed set environment variable that is picked implicitly.
  end
end