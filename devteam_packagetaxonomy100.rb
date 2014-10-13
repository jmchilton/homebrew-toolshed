require 'formula'
require 'json'

class DevteamPackagetaxonomy100 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_taxonomy_1_0_0
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://bitbucket.org/natefoo/taxonomy/get/97aef0c05300.zip"
  sha1 ""
  
  def install
    system "make" 
    prefix.install "taxBuilder"
    prefix.install "taxonomy2tree"
    prefix.install "tree2PS-fast"
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end