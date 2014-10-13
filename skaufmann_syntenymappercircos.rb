require 'formula'
require 'json'

class SkaufmannSyntenymappercircos < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/s-kaufmann/synteny_mapper
  # Tool Shed Readme:
  #    
  #    Downloads and installs Circos (v.0.64) for use in visualization. Requires perl to be installed.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://circos.ca/distribution/circos-0.64.tgz "
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/"
    mv Dir["./*"], "#{prefix}/" 
    environment([{'action'=> 'set', 'variable'=> 'CIRCOS_PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end