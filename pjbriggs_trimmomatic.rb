require 'formula'
require 'json'

class PjbriggsTrimmomatic < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/pjbriggs/trimmomatic
  # Tool Shed Readme:
  #    Trimmomatic requires the Java Runtime Environment
  #          
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.32.zip"
  sha1 ""
  
  def install
    environment_actions = []
    prefix.install "trimmomatic-0.32.jar"
    system "mkdir", "-p", "#{prefix}/adapters"
    mv Dir["adapters/*"], "#{prefix}/adapters" 
    environment_actions += [{'action'=> 'set', 'variable'=> 'TRIMMOMATIC_DIR', 'value'=> '$KEG_ROOT'}]
    environment_actions += [{'action'=> 'set', 'variable'=> 'TRIMMOMATIC_ADAPTERS_DIR', 'value'=> '$KEG_ROOT/adapters'}]
    environment(environment_actions)
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end