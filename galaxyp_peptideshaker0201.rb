require 'formula'
require 'json'

class GalaxypPeptideshaker0201 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/galaxyp/peptideshaker_0201
  # Tool Shed Readme:
  #    
  #          This package downloads and installs the peptideshaker tool as a part of the peptideshaker framework.
  #          (https://github.com/jmchilton/peptide-shaker).
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://peptide-shaker.googlecode.com/files/PeptideShaker-0.20.1.zip"
  sha1 ""
  
  def install
    system "ls" 
    system "chmod -R o+w resources" 
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