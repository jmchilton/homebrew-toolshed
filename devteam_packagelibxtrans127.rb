require 'formula'
require 'json'

class DevteamPackagelibxtrans127 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_libxtrans_1_2_7
  # Tool Shed Readme:
  #    X Network Transport layer shared code.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://ftp.x.org/pub/X11R7.7/src/lib/xtrans-1.2.7.tar.bz2"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix}" 
    system "make && make install" 
    environment([{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/share/pkgconfig'},{'action'=> 'set', 'variable'=> 'XTRANS_INCLUDES', 'value'=> '$KEG_ROOT/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end