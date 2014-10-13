require 'formula'
require 'json'

class DevteamPackagebwa0710039ea20639 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_bwa_0_7_10_039ea20639
  # Tool Shed Readme:
  #    
  #    Binary files in this package are compiled from github source code version 039ea20639
  #    This is package dependency for tools relying on bwa mapper package. This package is distributed as x86_64 binaries only. These binaries should work on any of our stated supported linux platforms other than RHEL/CentOS 5.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://depot.galaxyproject.org/package/linux/x86_64/bwa/bwa-0.7.10.039ea20639.tar.gz"
  sha1 ""
  
  def install
    prefix.install Dir["./*"]
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end