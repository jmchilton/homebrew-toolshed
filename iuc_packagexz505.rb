require 'formula'
require 'json'

class IucPackagexz505 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_xz_5_0_5
  # Tool Shed Readme:
  #    
  #            XZ Utils is free general-purpose data compression software with high compression ratio. XZ Utils were written for POSIX-like systems, 
  #            but also work on some not-so-POSIX systems. XZ Utils are the successor to LZMA Utils. 
  #    
  #            http://tukaani.org/xz/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://tukaani.org/xz/xz-5.0.5.tar.bz2"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagelibtool24"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    onoe("Unhandled tool shed action [autoconf] encountered.")
    environment([{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'set', 'variable'=> 'XZ_ROOT_PATH', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end