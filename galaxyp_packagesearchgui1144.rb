require 'formula'
require 'json'

class GalaxypPackagesearchgui1144 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/galaxyp/package_searchgui_1_14_4
  # Tool Shed Readme:
  #    
  #          Install Galaxy package application for SearchGUI 1.14.4.
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://searchgui.googlecode.com/files/SearchGUI-1.14.4-mac_and_linux.tar.gz"
  sha1 ""
  
  def install
    system "chmod -R o+w resources" 
    system "wget https://gist.github.com/jmchilton/5002161/raw/dc9fa36dd0e6eddcdf43cd2b659e4ecee5ad29df/SearchGUI" 
    system "wget https://gist.github.com/jmchilton/5002161/raw/b97fb4d9fe9927de1cfc5433dd1702252e9c0348/SearchCLI" 
    system "chmod +x SearchGUI" 
    system "chmod +x SearchCLI" 
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