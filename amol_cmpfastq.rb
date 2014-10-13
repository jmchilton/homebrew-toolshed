require 'formula'
require 'json'

class AmolCmpfastq < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/amol/cmpfastq
  # Tool Shed Readme:
  #    
  #               View the FastQ Validator overview at http://genome.sph.umich.edu/wiki/FastQValidator.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "
http://compbio.brc.iop.kcl.ac.uk/software/download/cmpfastq                "
  sha1 ""
  
  def install
    system "mkdir", "-p", "bin"
    mv "cmpfastq.plx", "bin"
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> 'bin'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end