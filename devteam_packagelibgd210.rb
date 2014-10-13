require 'formula'
require 'json'

class DevteamPackagelibgd210 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_libgd_2_1_0
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://bitbucket.org/libgd/gd-libgd/downloads/libgd-2.1.0.tar.bz2"
  sha1 ""
  
  depends_on "jmchilton/toolshed/devteam_packagelibpng167"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "./configure --prefix=#{prefix}" 
    system "make && make install" 
    environment([{'action'=> 'set', 'variable'=> 'GD_ROOT', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/lib/pkgconfig'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end