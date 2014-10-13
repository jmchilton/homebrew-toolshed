require 'formula'
require 'json'

class FcaramiaVarscan < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/fcaramia/varscan
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/varscan/VarScan.v2.3.5.jar"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/jars"
    mv "VarScan.v2.3.5.jar", "#{prefix}/jars"
    environment([{'action'=> 'set', 'variable'=> 'JAVA_JAR_PATH', 'value'=> '$KEG_ROOT/jars'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end