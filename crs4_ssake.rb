require 'formula'
require 'json'

class Crs4Ssake < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/crs4/ssake
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.bcgsc.ca/platform/bioinfo/software/ssake/releases/3.8.1/ssake_v3-8-1-tar.gz"
  sha1 ""
  
  def install
    environment_actions = []
    prefix.install Dir["./*"]
    environment_actions += [{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}]
    environment_actions += [{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/tools'}]
    environment(environment_actions)
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end