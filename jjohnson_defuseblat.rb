require 'formula'

class JjohnsonDefuseblat < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/jjohnson/defuse
  # Tool Shed Readme:
  #    
  #    This only handles blat for a non-commercial linux system.
  #    
  #    Please note that the Blat source and executables are freely available for
  #    academic, nonprofit and personal use. Commercial licensing information is
  #    available on the Kent Informatics website (http://www.kentinformatics.com/).
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/blat"
  sha1 ""
  
  def install
    system "chmod 755 blat" 
    bin.install "blat"
    # Tool Shed set environment variable that is picked implicitly.
  end
end