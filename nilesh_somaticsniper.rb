require 'formula'

class NileshSomaticsniper < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/nilesh/somaticsniper
  # Tool Shed Readme:
  #    
  #            	Somatic-sniper compiled version is unstable, for stable version use debian package system apt-get, this install requires cmake and zlib (for samtools)
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/samtools/samtools/0.1.6/samtools-0.1.6.tar.bz2"
  sha1 ""
  
  def install
    system "sed -i.bak 's/-lcurses/-lncurses/' Makefile" 
    system "sed -i.bak 's/-lz -L. -lbam/-lbam -lz -L./' Makefile" 
    system "make" 
    system "mkdir", "-p", "#{prefix}/lib/samtools"
    mv Dir["./*"], "#{prefix}/lib/samtools" 
    system "git clone --recursive git://github.com/genome/somatic-sniper.git" 
    system "mkdir", "-p", "#{prefix}/lib"
    mv Dir["./*"], "#{prefix}/lib" 
    system "mkdir", "-p", "#{prefix}/build"
    system "cmake -D Samtools_INCLUDE_DIR:PATH=#{prefix}/lib/samtools #{prefix}/lib/somatic-sniper" 
    system "make" 
    system "mkdir", "-p", "#{prefix}/build"
    mv Dir["./*"], "#{prefix}/build" 
    bin.install Dir["#{prefix}/build/bin/*"]
    # Tool Shed set environment variable that is picked implicitly.
  end
end