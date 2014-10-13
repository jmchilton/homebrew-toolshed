require 'formula'
require 'json'

class DevteamPackagesicer11 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_sicer_1_1
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://home.gwu.edu/~wpeng/SICER_V1.1.tgz"
  sha1 ""
  
  def install
    prefix.install Dir["./*"]
    system "sed -i 's#PATHTO=.\+#PATHTO=#{prefix}#' #{prefix}/SICER/*.sh" 
    system "sed -i 's#SICER=.\+#SICER=#{prefix}/SICER#' #{prefix}/SICER/*.sh" 
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/SICER'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end