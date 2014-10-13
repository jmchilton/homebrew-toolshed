require 'formula'

class DevteamPackagefreebayes0969608597d < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_freebayes_0_9_6_9608597d
  # Tool Shed Readme:
  #    
  #    FreeBayes requires g++ and the standard C and C++ development libraries.
  #    Additionally, cmake is required for building the BamTools API.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/i386/freebayes/freebayes-0.9.6_9608597d-Linux-i686.tgz"
    sha1 ""
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/x86_64/freebayes/freebayes-0.9.6_9608597d-Linux-x86_64.tgz"
    sha1 ""
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/x86_64/freebayes/freebayes-0.9.6_9608597d-Darwin-x86_64.tgz"
    sha1 ""
  else
    # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
    url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
    sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  end
  
  if OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  else
  end
  def install
    if OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
      bin.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      bin.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      bin.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    else
      system "git clone --recursive git://github.com/ekg/freebayes.git" 
      system "git checkout 9608597d12e127c847ae03aa03440ab63992fedf" 
      system "git submodule update --recursive" 
      system "make || ( make clean && sed -i.bak -e 's:LIBS = -lz -lm -L./ -L../vcflib/tabixpp/ -L$(BAMTOOLS_ROOT)/lib -ltabix:LIBS = -lm -L./ -L../vcflib/tabixpp/ -L$(BAMTOOLS_ROOT)/lib -ltabix -lz:g' src/Makefile && make )" 
      bin.install Dir["bin/*"]
      # Tool Shed set environment variable that is picked implicitly.
    end
  end
end