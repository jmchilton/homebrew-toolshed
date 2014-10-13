require 'formula'
require 'json'

class DevteamPackageccat30 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_ccat_3_0
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://cmb.gis.a-star.edu.sg/ChIPSeq/tools/CCAT3.0.tar.gz"
  sha1 ""
  
  def install
    cd 'src'
    system "sh make" 
    prefix.install "../bin/CCAT"
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end