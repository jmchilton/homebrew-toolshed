require 'formula'
require 'json'

class DevteamPackagesamtools0116 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_samtools_0_1_16
  # Tool Shed Readme:
  #    
  #    This is the last version of SAMTools to include the 'pileup' command.
  #    
  #    Program: samtools (Tools for alignments in the SAM format)
  #    Version: 0.1.16 (r963:234)
  #    
  #    Usage:   samtools <command> [options]
  #    
  #    Command: view        SAM<->BAM conversion
  #             sort        sort alignment file
  #             pileup      generate pileup output
  #             mpileup     multi-way pileup
  #             depth       compute the depth
  #             faidx       index/extract FASTA
  #             tview       text alignment viewer
  #             index       index alignment
  #             idxstats    BAM index stats (r595 or later)
  #             fixmate     fix mate information
  #             glfview     print GLFv3 file
  #             flagstat    simple stats
  #             calmd       recalculate MD/NM tags and '=' bases
  #             merge       merge sorted alignments
  #             rmdup       remove PCR duplicates
  #             reheader    replace BAM header
  #             cat         concatenate BAMs
  #             targetcut   cut fosmid regions (for fosmid pool only)
  #             phase       phase heterozygotes
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/i386/samtools/samtools-0.1.16-linux-i386.tgz"
    sha1 ""
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/x86_64/samtools/samtools-0.1.16-linux-x86_64.tgz"
    sha1 ""
  elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/i386/samtools/samtools-0.1.16-Darwin-i386.tgz"
    sha1 ""
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/x86_64/samtools/samtools-0.1.16-Darwin-x86_64.tgz"
    sha1 ""
  else
    url "http://depot.galaxyproject.org/package/source/samtools/samtools-0.1.16.tar.bz2"
    sha1 ""
  end
  
  if OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  else
  end
  def install
    if OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
      environment([{'action'=> 'set', 'variable'=> 'BAM_LIB_PATH', 'value'=> '$KEG_ROOT/lib'}])
    elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
      environment([{'action'=> 'set', 'variable'=> 'BAM_LIB_PATH', 'value'=> '$KEG_ROOT/lib'}])
    elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
      environment([{'action'=> 'set', 'variable'=> 'BAM_LIB_PATH', 'value'=> '$KEG_ROOT/lib'}])
    elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
      environment([{'action'=> 'set', 'variable'=> 'BAM_LIB_PATH', 'value'=> '$KEG_ROOT/lib'}])
    else
      system "sed -i.bak 's/-lcurses/-lncurses/' Makefile" 
      system "make" 
      bin.install "samtools"
      system "mkdir", "-p", "#{prefix}/lib"
      mv "libbam.a", "#{prefix}/lib"
      # Tool Shed set environment variable that is picked implicitly.
      environment([{'action'=> 'set', 'variable'=> 'BAM_LIB_PATH', 'value'=> '$KEG_ROOT/lib'}])
    end
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end