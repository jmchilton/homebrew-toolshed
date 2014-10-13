require 'formula'
require 'json'

class UrgiteamTandemrepeatsfinder < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/urgi-team/tandem_repeats_finder
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_64_bit?
    url "http://tandem.bu.edu/trf/downloads/trf400.linuxAMD64.exe"
    sha1 ""
  elsif OS.linux? and Hardware.is_32_bit?
    url "http://tandem.bu.edu/trf/downloads/trf400.linux.exe"
    sha1 ""
  end
  
  if OS.linux? and Hardware.is_64_bit?
  elsif OS.linux? and Hardware.is_32_bit?
  end
  def install
    if OS.linux? and Hardware.is_64_bit?
      prefix.install Dir["./*"]
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.linux? and Hardware.is_32_bit?
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