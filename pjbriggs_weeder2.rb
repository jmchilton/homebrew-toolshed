require 'formula'
require 'json'

class PjbriggsWeeder2 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/pjbriggs/weeder2
  # Tool Shed Readme:
  #    Installs Weeder 2.0
  #    
  #          See http://159.149.160.51/modtools/downloads/weeder2.html
  #          and http://159.149.160.51/modtools/
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://159.149.160.51/modtools/downloads/weeder2.0.tar.gz"
  sha1 ""
  
  def install
    environment_actions = []
    system "
	  g++ weeder2.cpp -o weeder2 -O3
	" 
    bin.install "weeder2"
    system "mkdir", "-p", "#{prefix}/FreqFiles"
    mv Dir["FreqFiles/*"], "#{prefix}/FreqFiles" 
    environment_actions += [{'action'=> 'set', 'variable'=> 'WEEDER_DIR', 'value'=> '$KEG_ROOT'}]
    environment_actions += [{'action'=> 'set', 'variable'=> 'WEEDER_FREQFILES_DIR', 'value'=> '$KEG_ROOT/FreqFiles'}]
    # Tool Shed set environment variable that is picked implicitly.
    environment(environment_actions)
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end