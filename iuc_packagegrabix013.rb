require 'formula'
require 'json'

class IucPackagegrabix013 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_grabix_0_1_3
  # Tool Shed Readme:
  #    
  #                Compiling grabix requires a recent C++ compiler (typically g++).
  #                grabix will be available in $PATH and under $GRABIX_ROOT.
  #                https://github.com/arq5x/grabix
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  def install
    system "git clone --recursive https://github.com/arq5x/grabix.git" 
    system "git reset --hard 989b021db5b3b68c501dd295fbd62e2457b061c4" 
    system "make" 
    bin.install "grabix"
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'GRABIX_ROOT', 'value'=> '$KEG_ROOT/bin'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end