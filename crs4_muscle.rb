require 'formula'
require 'json'

class Crs4Muscle < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/crs4/muscle
  # Tool Shed Readme:
  #    
  #    MUSCLE may require a lot of memory and computation time for a medium/large input multi-FASTA file, therefore a limit on the file size is enforced by the tool.
  #    Change the FASTA_MAX_SIZE variable in the installed env.sh file to adjust this limit to your needs and available resources.
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_src.tar.gz"
  sha1 ""
  
  def install
    system "sed -i 's/-static//g' src/mk" 
    system "make -C src/" 
    bin.install "src/muscle"
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'FASTA_MAX_SIZE', 'value'=> '100000'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end