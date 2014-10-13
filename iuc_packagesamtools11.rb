require 'formula'
require 'json'

class IucPackagesamtools11 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_samtools_1_1
  # Tool Shed Readme:
  #    
  #    Program: samtools (Tools for alignments in the SAM format)
  #    Version: 1.1 (using htslib 1.1)
  #    
  #    Usage:   samtools <command> [options]
  #    
  #    Commands:
  #      -- indexing
  #             faidx       index/extract FASTA
  #             index       index alignment
  #      -- editing
  #             calmd       recalculate MD/NM tags and '=' bases
  #             fixmate     fix mate information
  #             reheader    replace BAM header
  #             rmdup       remove PCR duplicates
  #             targetcut   cut fosmid regions (for fosmid pool only)
  #      -- file operations
  #             bamshuf     shuffle and group alignments by name
  #             cat         concatenate BAMs
  #             merge       merge sorted alignments
  #             mpileup     multi-way pileup
  #             sort        sort alignment file
  #             split       splits a file by read group
  #             bam2fq      converts a BAM to a FASTQ
  #      -- stats
  #             bedcov      read depth per BED region
  #             depth       compute the depth
  #             flagstat    simple stats
  #             idxstats    BAM index stats
  #             phase       phase heterozygotes
  #             stats       generate stats (former bamcheck)
  #      -- viewing
  #             flags       explain BAM flags
  #             tview       text alignment viewer
  #             view        SAM<->BAM<->CRAM conversion
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/x86_64/samtools/samtools-1.1-Linux-x86_64.tgz"
    sha1 ""
  else
    url "http://downloads.sourceforge.net/project/samtools/samtools/1.1/samtools-1.1.tar.bz2"
    sha1 ""
  end
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  else
    depends_on "jmchilton/toolshed/iuc_packagencurses59"
    depends_on "jmchilton/toolshed/iuc_packagezlib128"
  end
  def install
    if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
      environment([{'action'=> 'set', 'variable'=> 'SAMTOOLS_ROOT_PATH', 'value'=> '$KEG_ROOT'}])
    else
      # Skipping set_environment_for_install command, handled by platform brew.
      system "sed -i 's/-lcurses/-lncurses/' Makefile" 
      system "sed -i -e \"s|CFLAGS=\s*-g\s*-Wall\s*-O2\s*|CFLAGS= -g -Wall -O2 -I$NCURSES_INCLUDE_PATH/ncurses/ -I$NCURSES_INCLUDE_PATH -L$NCURSES_LIB_PATH|g\" Makefile" 
      system "make" 
      bin.install "samtools"
      # Tool Shed set environment variable that is picked implicitly.
      environment([{'action'=> 'set', 'variable'=> 'SAMTOOLS_ROOT_PATH', 'value'=> '$KEG_ROOT'}])
    end
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end