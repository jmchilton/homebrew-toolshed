require 'formula'
require 'json'

class DevteamPackageweblogo33 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_weblogo_3_3
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://weblogo.googlecode.com/files/weblogo-3.3.tar.gz"
  sha1 ""
  
  def install
    system "sed -i.bak 's#\"-dPDFSETTINGS=/printer\",#\"-dPDFSETTINGS=/screen\",#' weblogolib/__init__.py" 
    prefix.install Dir["./*"]
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end