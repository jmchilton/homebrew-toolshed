require 'formula'
require 'json'

class IracookePackagepeptideshaker031 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iracooke/package_peptideshaker_0_31
  # Tool Shed Readme:
  #    
  #            Install Galaxy package application for PeptideShaker 0.31.4
  #            http://peptide-shaker.googlecode.com 
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://genesis.ugent.be/maven2/eu/isas/peptideshaker/PeptideShaker/0.31.4/PeptideShaker-0.31.4.zip"
  sha1 ""
  
  def install
    system "chmod -R o+w resources" 
    system "mkdir", "-p", "#{prefix}/"
    mv Dir["./*"], "#{prefix}/" 
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'},{'action'=> 'set', 'variable'=> 'PEPTIDESHAKER_ROOT_PATH', 'value'=> '$KEG_ROOT'},{'action'=> 'set', 'variable'=> 'PEPTIDESHAKER_JAR_PATH', 'value'=> '$KEG_ROOT/PeptideShaker-0.31.4.jar'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end