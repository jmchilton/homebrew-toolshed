require 'formula'
require 'json'

class BgrueningCrisprrecognitiontool < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/bgruening/crispr_recognition_tool
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.room220.com/crt/CRT1.2-CLI.jar.zip"
  sha1 ""
  
  def install
    prefix.install Dir["./*"]
    environment([{'action'=> 'set', 'variable'=> 'CRISPR_RECOGNITION_TOOL_JAR_PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end