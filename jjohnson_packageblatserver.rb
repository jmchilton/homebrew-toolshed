require 'formula'

class JjohnsonPackageblatserver < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/jjohnson/package_blat_server
  # Tool Shed Readme:
  #    
  #    Downloads and installs the latest kent blat server tools (blat, gfServer, gfClient, faToTwoBit).
  #    It will try to install executable files from:  UCSC ftp://hgdownload.cse.ucsc.edu/admin/exe/
  #    otherwise it will try to compile from source from:  UCSC at: http://hgdownload.cse.ucsc.edu/admin/jksrc.zip
  #    ( The website doesn't offer previously released versions. )
  #    
  #    NOTE: A license is required for use in a COMMERCIAL system.
  #    
  #    Blat source and executables are freely available for academic, nonprofit and personal use. 
  #    Commercial licensing information is available on the Kent Informatics website (http://www.kentinformatics.com/).
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "ftp://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/blat", :using => :nounzip
    sha1 ""
    resource 'gfServe' do
      url "ftp://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/gfServer", :using => :nounzip
      sha1 ""
    end
    resource 'gfClien' do
      url "ftp://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/gfClient", :using => :nounzip
      sha1 ""
    end
    resource 'faToTwoB' do
      url "ftp://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/faToTwoBit", :using => :nounzip
      sha1 ""
    end
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "ftp://hgdownload.cse.ucsc.edu/admin/exe/macOSX.x86_64/blat", :using => :nounzip
    sha1 ""
    resource 'gfClien' do
      url "ftp://hgdownload.cse.ucsc.edu/admin/exe/macOSX.x86_64/gfClient", :using => :nounzip
      sha1 ""
    end
    resource 'gfServe' do
      url "ftp://hgdownload.cse.ucsc.edu/admin/exe/macOSX.x86_64/gfServer", :using => :nounzip
      sha1 ""
    end
    resource 'faToTwoB' do
      url "ftp://hgdownload.cse.ucsc.edu/admin/exe/macOSX.x86_64/faToTwoBit", :using => :nounzip
      sha1 ""
    end
  else
    url "http://hgdownload.cse.ucsc.edu/admin/jksrc.zip"
    sha1 ""
  end
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  else
  end
  def install
    if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      resource('gfServe').stage do
          # Tool Shed would download inside build directory instead of its own - so move download.
          buildpath.install Dir["*"]
      end
      resource('gfClien').stage do
          # Tool Shed would download inside build directory instead of its own - so move download.
          buildpath.install Dir["*"]
      end
      resource('faToTwoB').stage do
          # Tool Shed would download inside build directory instead of its own - so move download.
          buildpath.install Dir["*"]
      end
      system "chmod ugo+x *" 
      bin.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      resource('gfClien').stage do
          # Tool Shed would download inside build directory instead of its own - so move download.
          buildpath.install Dir["*"]
      end
      resource('gfServe').stage do
          # Tool Shed would download inside build directory instead of its own - so move download.
          buildpath.install Dir["*"]
      end
      resource('faToTwoB').stage do
          # Tool Shed would download inside build directory instead of its own - so move download.
          buildpath.install Dir["*"]
      end
      system "chmod ugo+x *" 
      bin.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    else
      system <<-EOF
export MACHTYPE=`uname -m`;
export BINDIR=#{prefix}/bin; mkdir #{prefix}/bin;
cd src/lib; make;
cd ../jkOwnLib; make;
cd ../blat; make;
cd ../gfClient; make;
cd ../gfServer; make;
cd ../utils; mv makefile makefile.orig; grep -v -E 'pslLiftSubrangeBlat|raSqlQuery|scaffoldFaToAgp' makefile.orig > makefile;  make
EOF
      # Tool Shed set environment variable that is picked implicitly.
    end
  end
end