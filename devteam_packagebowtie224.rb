require 'formula'
require 'json'

class DevteamPackagebowtie224 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_bowtie_2_2_4
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_64_bit?
    url "http://depot.galaxyproject.org/package/linux/x86_64/bowtie2/bowtie2-2.2.4-linux-x86_64.tgz"
    sha1 ""
  elsif OS.mac? and Hardware.is_64_bit?
    url "http://depot.galaxyproject.org/package/darwin/x86_64/bowtie2/bowtie2-2.2.4-macos-x86_64.tgz"
    sha1 ""
  end
  
  if OS.linux? and Hardware.is_64_bit?
  elsif OS.mac? and Hardware.is_64_bit?
  end
  def install
    if OS.linux? and Hardware.is_64_bit?
      prefix.install Dir["./*"]
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.mac? and Hardware.is_64_bit?
      prefix.install Dir["./*"]
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    end
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end