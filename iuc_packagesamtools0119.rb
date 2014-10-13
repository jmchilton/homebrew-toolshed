require 'formula'

class IucPackagesamtools0119 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_samtools_0_1_19
  # Tool Shed Readme:
  #    
  #    Program: samtools (Tools for alignments in the SAM format)
  #    Version: 0.1.19
  #    
  #    Usage:   samtools <command> [options]
  #    
  #    Command: view        SAM<->BAM conversion
  #             sort        sort alignment file
  #             mpileup     multi-way pileup
  #             depth       compute the depth
  #             faidx       index/extract FASTA
  #             tview       text alignment viewer
  #             index       index alignment
  #             idxstats    BAM index stats (r595 or later)
  #             fixmate     fix mate information
  #             flagstat    simple stats
  #             calmd       recalculate MD/NM tags and '=' bases
  #             merge       merge sorted alignments
  #             rmdup       remove PCR duplicates
  #             reheader    replace BAM header
  #             cat         concatenate BAMs
  #             targetcut   cut fosmid regions (for fosmid pool only)
  #             phase       phase heterozygotes
  #    
  #    Requirements: libncurses header files
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/samtools/samtools/0.1.19/samtools-0.1.19.tar.bz2"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagencurses59"
  depends_on "jmchilton/toolshed/iuc_packagezlib128"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "sed -i 's/-lcurses/-lncurses/' Makefile" 
    system "sed -i -e \"s|CFLAGS=\s*-g\s*-Wall\s*-O2\s*|CFLAGS= -g -Wall -O2 -I$NCURSES_INCLUDE_PATH/ncurses/ -I$NCURSES_INCLUDE_PATH -L$NCURSES_LIB_PATH|g\" Makefile" 
    system "make" 
    bin.install "samtools"
    # Tool Shed set environment variable that is picked implicitly.
  end
end