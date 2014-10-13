require 'formula'
require 'json'

class DevteamPackagelibx11150 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_libx11_1_5_0
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://ftp.x.org/pub/X11R7.7/src/lib/libX11-1.5.0.tar.bz2"
  sha1 ""
  
  depends_on "jmchilton/toolshed/devteam_packagelibxproto7023"
  depends_on "jmchilton/toolshed/devteam_packagelibxtrans127"
  depends_on "jmchilton/toolshed/devteam_packagelibpthreadstubs03"
  depends_on "jmchilton/toolshed/devteam_packagelibxextproto721"
  depends_on "jmchilton/toolshed/devteam_packagexorgmacros1171"
  depends_on "jmchilton/toolshed/devteam_packagelibxcb191"
  depends_on "jmchilton/toolshed/devteam_packagekbproto106"
  depends_on "jmchilton/toolshed/devteam_packageinputproto22"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "export CFLAGS=\"-I$XPROTO_INCLUDES -I$XTRANS_INCLUDES -I$KBPROTO_INCLUDES -I$INPUTPROTO_INCLUDES -I$XCB_INCLUDES\" && ./configure --prefix=#{prefix}" 
    system "make && make install" 
    environment([{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/lib/pkgconfig'},{'action'=> 'set', 'variable'=> 'X11_LIB_DIR', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'set', 'variable'=> 'X11_INCLUDE_DIR', 'value'=> '$KEG_ROOT/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end