require 'formula'
require 'json'

class DevteamPackagepicard1560 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_picard_1_56_0
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/picard/picard-tools/1.56/picard-tools-1.56.zip"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/jars"
    mv Dir["picard-tools-1.56/*"], "#{prefix}/jars" 
    environment([{'action'=> 'set', 'variable'=> 'JAVA_JAR_PATH', 'value'=> '$KEG_ROOT/jars'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end