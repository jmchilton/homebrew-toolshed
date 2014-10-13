require 'formula'

class DevteamPackagebwa062 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_bwa_0_6_2
  # Tool Shed Readme:
  #    
  #    Program: bwa (alignment via Burrows-Wheeler transformation)
  #    Version: 0.6.2-r126
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
  
  url "http://downloads.sourceforge.net/project/bio-bwa/bwa-0.6.2.tar.bz2"
  sha1 ""
  
  def install
    system "make" 
    bin.install "bwa"
    # Tool Shed set environment variable that is picked implicitly.
  end
end