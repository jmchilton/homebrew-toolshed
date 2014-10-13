require 'formula'
require 'json'

class GalaxypSearchgui < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/galaxyp/searchgui
  # Tool Shed Readme:
  #    
  #              This package downloads and installs the SearchGUI scripts develped as part of the Peptideshaker tool.
  #              (https://github.com/jmchilton/peptide-shaker).
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://searchgui.googlecode.com/files/SearchGUI-1.14.0-mac_and_linux.tar.gz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/"
    mv Dir["./*"], "#{prefix}/" 
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end