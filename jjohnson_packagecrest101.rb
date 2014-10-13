require 'formula'
require 'json'

class JjohnsonPackagecrest101 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/jjohnson/package_crest_1_0_1
  # Tool Shed Readme:
  #    
  #    CREST
  #    
  #    CREST (Clipping Reveals Structure) is a new algorithm for detecting genomic structural variations at base-pair resolution using next-generation sequencing data. Please cite the following article:
  #    
  #    Wang J, Mullighan CG, Easton J, Roberts S, Heatley SL, Ma J, Rusch MC, Chen K, Harris CC, Ding L, Holmfeldt L, Payne-Turner D, Fan X, Wei L, Zhao D, Obenauer JC, Naeve C, Mardis ER, Wilson RK, Downing JR and Zhang J. CREST maps somatic structural variation in cancer genomes with base-pair resolution (2011). Nature Methods.
  #    
  #    The source code can be downloaded here and used according to the terms of the GNU General Public License (GPL), version 2 or later. 
  #    
  #    Users will need to obtain the BLAT and CAP3 programs separately to use CREST; BLAT and CAP3 are free for academic use but require licensing fees for commercial use. The open source BioPerl and SAMtools libraries are also needed to use CREST.
  #    
  #    http://www.stjuderesearch.org/site/lab/zhang
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://ftp.stjude.org/pub/software/CREST/CREST.tgz"
  sha1 ""
  
  def install
    environment_actions = []
    prefix.install Dir["./*"]
    environment_actions += [{'action'=> 'set', 'variable'=> 'CREST_DIRECTORY', 'value'=> '$KEG_ROOT'}]
    environment_actions += [{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}]
    environment(environment_actions)
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end