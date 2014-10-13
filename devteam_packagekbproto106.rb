require 'formula'
require 'json'

class DevteamPackagekbproto106 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_kbproto_1_0_6
  # Tool Shed Readme:
  #    X Network Transport layer shared code.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://ftp.x.org/pub/X11R7.7/src/proto/kbproto-1.0.6.tar.bz2"
  sha1 ""
  
  depends_on "jmchilton/toolshed/devteam_packagelibxslt1128"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "./configure --prefix=#{prefix}" 
    system "make && make install" 
    environment([{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/lib/pkgconfig'},{'action'=> 'set', 'variable'=> 'KBPROTO_INCLUDES', 'value'=> '$KEG_ROOT/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end