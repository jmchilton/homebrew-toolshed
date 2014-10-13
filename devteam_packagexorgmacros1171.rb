require 'formula'
require 'json'

class DevteamPackagexorgmacros1171 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_xorg_macros_1_17_1
  # Tool Shed Readme:
  #    X.org autoconf macros.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://ftp.x.org/pub/individual/util/util-macros-1.17.1.tar.bz2"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix}" 
    system "make && make install" 
    environment([{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/share/pkgconfig'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end