require 'formula'

class DevteamFreebayes09148a407cf5f4 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/freebayes_0_9_14_8a407cf5f4
  # Tool Shed Readme:
  #    
  #    	  Starting from version freebayes-0.9.14_8a407cf5f4 freebayes is distributed through ToolShed only as pre-compiled x86_64 linux binaries.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://depot.galaxyproject.org/package/linux/x86_64/freebayes/freebayes-0.9.14_8a407cf5f4-Linux-x86_64.tgz"
  sha1 ""
  
  def install
    bin.install Dir["./*"]
    # Tool Shed set environment variable that is picked implicitly.
  end
end