require 'formula'

class LomereiterSambambafilter < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/lomereiter/sambamba_filter
  # Tool Shed Readme:
  #    
  #     This tool uses the sambamba view command to filter BAM/SAM on flags, fields, tags, and region. Input is SAM or BAM file.
  #    
  #    There are a three options for installation of sambamba:
  #    
  #    	1) Automated toolshed installation.  This requires that a D2 compiler (dmd >= 2.063) is installed.  The automated installation will attempt to use the dmd compiler and thus **will not be optimized**.  
  #    
  #    	2) Manual compilation.  For performance reasons, the sambamba developers recommend you use either GDC or LDC as they use GCC and LLVM backends and do a much better job at optimization.  You should then use the sambamba-ldmd2-64 make target.  See https://github.com/lomereiter/sambamba/wiki/Command-line-tools for more information.
  #    
  #    	3) Precompiled binary (recommended).  You may wish to simply use a precompiled binary of sambamba available at https://www.dropbox.com/sh/v05fsb5aarob3xe/iUHgyud31a/sambamba.  
  #    
  #    If you choose option 2 or 3, sambamba may be installed as a "Managed Dependency" in Galaxy's "tool_dependency_dir".  See http://wiki.galaxyproject.org/Admin/Config/Tool%20Dependencies. 
  #    
  #    The development repository for the galaxy wrapper is at: https://bitbucket.org/lance_parsons/sambamba_filter_galaxy_wrapper.
  #    The sambamba development repository is at: https://github.com/lomereiter/sambamba.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  def install
    system "git clone --recursive https://github.com/lomereiter/sambamba" 
    system "git checkout v0.3.3" 
    system "git submodule update --recursive" 
    system "make release" 
    bin.install Dir["build/*"]
    # Tool Shed set environment variable that is picked implicitly.
  end
end