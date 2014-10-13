require 'formula'
require 'json'

class DevteamPackagelibxcb191 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_libxcb_1_9_1
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://xorg.freedesktop.org/archive/individual/xcb/libxcb-1.9.1.tar.bz2"
  sha1 ""
  
  depends_on "jmchilton/toolshed/devteam_packagelibxslt1128"
  depends_on "jmchilton/toolshed/devteam_packagelibxcbproto18"
  depends_on "jmchilton/toolshed/devteam_packagelibxau108"
  depends_on "jmchilton/toolshed/devteam_packagelibpthreadstubs03"
  depends_on "jmchilton/toolshed/devteam_packagelibxproto7023"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "./configure --prefix=#{prefix}" 
    system "make && make install" 
    environment([{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/lib/pkgconfig'},{'action'=> 'set', 'variable'=> 'XCB_INCLUDES', 'value'=> '$KEG_ROOT/include'},{'action'=> 'set', 'variable'=> 'XCB_LIBS', 'value'=> '$KEG_ROOT/lib'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end