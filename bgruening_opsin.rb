require 'formula'
require 'json'

class BgrueningOpsin < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/bgruening/opsin
  # Tool Shed Readme:
  #    Opsin requires a JAVA (1.5+) runtime evironment.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://bitbucket.org/dan2097/opsin/downloads/opsin-1.4.0-jar-with-dependencies.jar"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/jars"
    mv "opsin-1.4.0-jar-with-dependencies.jar", "#{prefix}/jars"
    environment([{'action'=> 'set', 'variable'=> 'JAVA_JAR_PATH', 'value'=> '$KEG_ROOT/jars'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end