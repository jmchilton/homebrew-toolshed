require 'formula'
require 'json'

class GeorgeweingartMetaphlan < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/george-weingart/metaphlan
  # Tool Shed Readme:
  #    
  #    These links provide information for the metaphlan package:
  #    http://huttenhower.sph.harvard.edu/metaphlan
  #    https://groups.google.com/forum/#!forum/metaphlan-users
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  depends_on "jmchilton/toolshed/devteam_packagenumpy17"
  depends_on "jmchilton/toolshed/devteam_packagebowtie2210"
  def install
    environment_actions = []
    system "hg clone https://bitbucket.org/nsegata/metaphlan" 
    prefix.install Dir["./*"]
    environment_actions += [{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}]
    environment_actions += [{'action'=> 'set', 'variable'=> 'METAPHLAN_PATH', 'value'=> '$KEG_ROOT'}]
    environment(environment_actions)
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end