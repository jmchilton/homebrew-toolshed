require 'formula'

class FcaramiaSomaticsniper < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/fcaramia/somatic_sniper
  # Tool Shed Readme:
  #    
  #            	Somatic-sniper compiled version is unstable, for stable version use debian package system apt-get, this install requires cmake and zlib (for samtools)
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/samtools/samtools/0.1.6/samtools-0.1.6.tar.bz2"
  sha1 ""
  resource 'master' do
    url "https://github.com/genome/somatic-sniper/archive/master.zip", :using => :nounzip
    sha1 ""
  end
  resource 'maste' do
    url "https://github.com/genome/build-common/tarball/master", :using => :nounzip
    sha1 ""
  end
  
  def install
    system "sed -i.bak 's/-lcurses/-lncurses/' Makefile" 
    system "sed -i.bak 's/-lz -L. -lbam/-lbam -lz -L./' Makefile" 
    system "make" 
    system "mkdir", "-p", "#{prefix}/bin/samtools"
    mv Dir["./*"], "#{prefix}/bin/samtools" 
    resource('master').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('maste').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    system "unzip master.zip" 
    system "tar -xzvf master" 
    system "rm -rf  somatic-sniper-master/build-common/" 
    system "mv genome-build-common-077bd57/ somatic-sniper-master/build-common/" 
    system "cmake -D Samtools_INCLUDE_DIR:PATH=#{prefix}/bin/samtools somatic-sniper-master/ && make" 
    bin.install Dir["bin/*"]
    # Tool Shed set environment variable that is picked implicitly.
  end
end