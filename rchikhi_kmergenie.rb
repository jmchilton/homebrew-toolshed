require 'formula'
require 'json'

class RchikhiKmergenie < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/rchikhi/kmergenie
  # Tool Shed Readme:
  #    
  #    KmerGenie requires Python 2.6+ and R.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://kmergenie.bx.psu.edu/kmergenie-1.6715.tar.gz"
  sha1 ""
  
  def install
    system "make" 
    prefix.install Dir["./*"]
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end