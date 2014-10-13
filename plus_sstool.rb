require 'formula'

class PlusSstool < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/plus/ss_tool
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://s3-us-west-2.amazonaws.com/mayo-bic-tools/softsearch/Softsearch2.4.tar.gz
"
  sha1 ""
  
  def install
    system "tar xvzf Softsearch2.4.tar.gz" 
    system "cd 2.4/" 
    system "perl ./install.pl --prefix=$PWD" 
    system "export PERL5LIB=$PERL5LIB:$PWD:$PWD/lib" 
    system "perl script/SoftSearch.pl" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end