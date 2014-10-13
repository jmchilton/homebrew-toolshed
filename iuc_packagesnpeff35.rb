require 'formula'
require 'json'

class IucPackagesnpeff35 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_snpeff_3_5
  # Tool Shed Readme:
  #    
  #    
  #    SnpEff ( http://snpeff.sourceforge.net/ )
  #    
  #    "A program for annotating and predicting the effects of single nucleotide polymorphisms, SnpEff: SNPs in the genome of Drosophila melanogaster strain w1118; iso-2; iso-3.", Cingolani P, Platts A, Wang le L, Coon M, Nguyen T, Wang L, Land SJ, Lu X, Ruden DM. Fly (Austin). 2012 Apr-Jun;6(2):80-92. PMID: 22728672 [PubMed - in process]
  #    
  #    This repository contains a tool_dependencies.xml file that downloads and installs SnpEff and SnpSift (SnpEff.jar and SnpSift.jar)
  #    
  #    The install create an environment variable: SNPEFF_JAR_PATH that contains the path to the jar files.   Tools using this can generate a command line:
  #    java -Xmx6G -jar \$SNPEFF_JAR_PATH/snpEff.jar eff -c \$SNPEFF_JAR_PATH/snpEff.config   ...
  #    
  #    The snpEff.config file is also installed, which specifies the default location for installed SnpEff genome databases:
  #    data_dir = ~/snpEff/data/
  #    
  #    The location of a genome database can be set via the commandline option -dataDir.  
  #    
  #    Another way to change the location of data_dir would be to create a symbolic link in the galaxy HOME directory:
  #    ln -s genome_data_path/snpEff ~/snpEff
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://sourceforge.net/projects/snpeff/files/snpEff_v3_5_core.zip"
  sha1 ""
  
  def install
    environment_actions = []
    prefix.install Dir["./*"]
    environment_actions += [{'action'=> 'set', 'variable'=> 'SNPEFF_JAR_PATH', 'value'=> '$KEG_ROOT'}]
    environment_actions += [{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/scripts'}]
    environment(environment_actions)
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end