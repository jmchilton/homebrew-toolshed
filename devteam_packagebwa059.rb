require 'formula'

class DevteamPackagebwa059 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_bwa_0_5_9
  # Tool Shed Readme:
  #    
  #    This is the last version of BWA that uses separate files for BWT and reverse BWT.
  #    
  #    Program: bwa (alignment via Burrows-Wheeler transformation)
  #    Version: 0.5.9-r16
  #    Contact: Heng Li <lh3@sanger.ac.uk>
  #    
  #    Usage:   bwa <command> [options]
  #    
  #    Command: index         index sequences in the FASTA format
  #             aln           gapped/ungapped alignment
  #             samse         generate alignment (single ended)
  #             sampe         generate alignment (paired ended)
  #             bwasw         BWA-SW for long queries
  #    
  #             fa2pac        convert FASTA to PAC format
  #             pac2bwt       generate BWT from PAC
  #             pac2bwtgen    alternative algorithm for generating BWT
  #             bwtupdate     update .bwt to the new format
  #             pac_rev       generate reverse PAC
  #             bwt2sa        generate SA from BWT and Occ
  #             pac2cspac     convert PAC to color-space PAC
  #             stdsw         standard SW/NW alignment
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/i386/bwa/bwa-0.5.9-Linux-i686.tgz"
    sha1 ""
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/x86_64/bwa/bwa-0.5.9-Linux-x86_64.tgz"
    sha1 ""
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/x86_64/bwa/bwa-0.5.9-Darwin-x86_64.tgz"
    sha1 ""
  else
    url "http://downloads.sourceforge.net/project/bio-bwa/bwa-0.5.9.tar.bz2"
    sha1 ""
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
      system "make" 
      bin.install "bwa"
      # Tool Shed set environment variable that is picked implicitly.
    end
  end
end