require 'formula'
require 'json'

class BonsaiSortmerna < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/bonsai/sortmerna
  # Tool Shed Readme:
  #    
  #    SortMeRNA requires g++ 4.3 or later. Installation may take a moment since ribosomal databases have to be indexed.
  #    	
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://bioinfo.lifl.fr/RNA/sortmerna/code/sortmerna-1.7.tar.gz"
  sha1 ""
  
  def install
    system "./configure" 
    system "make" 
    system "make check" 
    bin.install "sortmerna"
    bin.install "buildtrie"
    bin.install "scripts/merge-paired-reads.sh"
    system "mkdir", "-p", "#{prefix}/rRNA_databases"
    mv Dir["rRNA_databases/*"], "#{prefix}/rRNA_databases" 
    system "mkdir", "-p", "#{prefix}/automata"
    mv Dir["automata/*"], "#{prefix}/automata" 
    environment([{'action'=> 'set', 'variable'=> 'SORTMERNADIR', 'value'=> '$KEG_ROOT'}])
    # Tool Shed set environment variable that is picked implicitly.
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end