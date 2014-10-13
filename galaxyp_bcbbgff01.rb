require 'formula'
require 'json'

class GalaxypBcbbgff01 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/galaxyp/bcbb_gff_0_1
  # Tool Shed Readme:
  #    
  #    https://github.com/chapmanb/bcbb/tree/master/gff
  #    http://biopython.org/wiki/GFF_Parsing
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/chapmanb/bcbb/archive/master.zip"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/"
    mv Dir["gff/*"], "#{prefix}/" 
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end