require 'formula'
require 'json'

class Crs4Mosaik2 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/crs4/mosaik2
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  def install
    system "git clone https://github.com/wanpinglee/MOSAIK.git mosaik" 
    system "git reset --hard e04c806bb1410cf1dbd1534991c46d696aec6723" 
    system "sed -i 's/ -static//g' src/includes/linux.inc" 
    system "make -C src/" 
    bin.install Dir["bin/*"]
    system "mkdir", "-p", "#{prefix}/networkFile"
    mv Dir["src/networkFile/*"], "#{prefix}/networkFile" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'MOSAIK_NETWORK_DIR', 'value'=> '$KEG_ROOT/networkFile'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end