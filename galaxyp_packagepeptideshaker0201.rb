require 'formula'
require 'json'

class GalaxypPackagepeptideshaker0201 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/galaxyp/package_peptideshaker_0_20_1
  # Tool Shed Readme:
  #    
  #          Install Galaxy package application for PeptideShaker 0.20.1.
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://peptide-shaker.googlecode.com/files/PeptideShaker-0.20.1.zip"
  sha1 ""
  
  def install
    system "chmod -R o+w resources" 
    system "wget https://gist.github.com/jmchilton/5002161/raw/f1fe76d6e6eed99a768ed0b9f41c2d0a6a4b24b7/PeptideShaker" 
    system "wget https://gist.github.com/jmchilton/5002161/raw/8a17d5fb589984365284e55a98a455c2b47da54f/PeptideShakerCLI" 
    system "chmod +x PeptideShaker" 
    system "chmod +x PeptideShakerCLI" 
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