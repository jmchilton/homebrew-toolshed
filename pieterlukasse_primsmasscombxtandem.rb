require 'formula'
require 'json'

class PieterlukassePrimsmasscombxtandem < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/pieterlukasse/prims_masscomb
  # Tool Shed Readme:
  #    
  #    Ensures XTandem is installed. 
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://ftp.thegpm.org/projects/tandem/source/2011-12-01/tandem-linux-12-10-01-1.zip"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/tandem-linux-12-10-01-1"
    mv Dir["../tandem-linux-12-10-01-1/*"], "#{prefix}/tandem-linux-12-10-01-1" 
    system "chmod 755 #{prefix}/tandem-linux-12-10-01-1/bin/tandem.exe" 
    environment([{'action'=> 'set', 'variable'=> 'XTANDEM_12_10_01_PATH', 'value'=> '$KEG_ROOT/tandem-linux-12-10-01-1'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end