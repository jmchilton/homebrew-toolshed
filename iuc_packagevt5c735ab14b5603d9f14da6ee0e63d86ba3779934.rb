require 'formula'
require 'json'

class IucPackagevt5c735ab14b5603d9f14da6ee0e63d86ba3779934 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_vt_5c735ab14b5603d9f14da6ee0e63d86ba3779934
  # Tool Shed Readme:
  #    
  #                vt is a variant tool set that discovers short variants from Next Generation Sequencing data.
  #                http://genome.sph.umich.edu/wiki/Vt
  #                https://github.com/atks/vt
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  def install
    system "git clone --recursive https://github.com/atks/vt.git" 
    system "git reset --hard 53148a95008ce9cdda87322bbd23965ed780ca74" 
    system "make" 
    bin.install "vt"
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'VT_ROOT_PATH', 'value'=> '$KEG_ROOT/bin'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end