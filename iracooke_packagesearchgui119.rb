require 'formula'
require 'json'

class IracookePackagesearchgui119 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iracooke/package_searchgui_1_19
  # Tool Shed Readme:
  #    
  #                Install Galaxy package application for SearchGUI 1.19.5
  #                http://code.google.com/p/searchgui/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://genesis.ugent.be/maven2/eu/isas/searchgui/SearchGUI/1.19.5/SearchGUI-1.19.5-mac_and_linux.tar.gz"
  sha1 ""
  
  def install
    system "chmod -R o+w resources" 
    system "mkdir", "-p", "#{prefix}/"
    mv Dir["./*"], "#{prefix}/" 
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'},{'action'=> 'set', 'variable'=> 'SEARCHGUI_ROOT_PATH', 'value'=> '$KEG_ROOT'},{'action'=> 'set', 'variable'=> 'SEARCHGUI_JAR_PATH', 'value'=> '$KEG_ROOT/SearchGUI-1.19.5.jar'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end