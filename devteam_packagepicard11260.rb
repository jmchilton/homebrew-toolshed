require 'formula'
require 'json'

class DevteamPackagepicard11260 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_picard_1_126_0
  # Tool Shed Readme:
  #    
  #    This picard package dependency is retrieved directly from https://github.com/broadinstitute/picard/releases
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/broadinstitute/picard/releases/download/1.126/picard-tools-1.126.zip"
  sha1 ""
  
  def install
    prefix.install Dir["./*"]
    environment([{'action'=> 'set', 'variable'=> 'JAVA_JAR_PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end