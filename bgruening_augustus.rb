require 'formula'
require 'json'

class BgrueningAugustus < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/bgruening/augustus
  # Tool Shed Readme:
  #    AUGUSTUS is a gene prediction program for eukaryotes written by Mario Stanke and Oliver Keller.
  #    It can be used as an ab initio program, which means it bases its prediction purely on the
  #    sequence. AUGUSTUS may also incorporate hints on the gene structure coming from extrinsic sources
  #    such as EST, MS/MS, protein alignments and synthenic genomic alignments.
  #    http://augustus.gobics.de/binaries/README.TXT
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://bioinf.uni-greifswald.de/augustus/binaries/augustus.2.7.tar.gz"
  sha1 ""
  
  def install
    system "make" 
    bin.install Dir["bin/*"]
    system "mkdir", "-p", "#{prefix}/scripts"
    mv Dir["scripts/*"], "#{prefix}/scripts" 
    system "mkdir", "-p", "#{prefix}/config"
    mv Dir["config/*"], "#{prefix}/config" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/scripts'},{'action'=> 'set', 'variable'=> 'AUGUSTUS_CONFIG_PATH', 'value'=> '$KEG_ROOT/config'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end