require 'formula'
require 'json'

class PieterlukassePrimsmasscombproteowizard < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/pieterlukasse/prims_masscomb
  # Tool Shed Readme:
  #    
  #    Ensures ProteoWizard binaries are installed. 
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://toolshed.g2.bx.psu.edu/repos/pieterlukasse/prims_masscomb/raw-file/tip/pwiz-bin-linux-x86_64-gcc48-release-3_0_5622.tar.bz2"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/pwiz_3_0_5622"
    mv Dir["./*"], "#{prefix}/pwiz_3_0_5622" 
    environment([{'action'=> 'set', 'variable'=> 'PWIZ_3_0_5622_PATH', 'value'=> '$KEG_ROOT/pwiz_3_0_5622'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end