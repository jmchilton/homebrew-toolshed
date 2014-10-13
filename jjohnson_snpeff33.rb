require 'formula'
require 'json'

class JjohnsonSnpeff33 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/jjohnson/snpeff_3_3
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://sourceforge.net/projects/snpeff/files/snpEff_v3_3_core.zip"
  sha1 ""
  
  def install
    environment_actions = []
    prefix.install Dir["./*"]
    environment_actions += [{'action'=> 'set', 'variable'=> 'JAVA_JAR_PATH', 'value'=> '$KEG_ROOT'}]
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