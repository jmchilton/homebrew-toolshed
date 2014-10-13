require 'formula'
require 'json'

class DevteamPackagepixman0324 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_pixman_0_32_4
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://cairographics.org/releases/pixman-0.32.4.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/devteam_packagelibpng167"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "export LDFLAGS=\"-Wl,-rpath,$PNG_LIB_PATH\" && echo $LDFLAGS && ./configure --prefix=#{prefix}" 
    system "make install"
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'PIXMAN_LIB_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/lib/pkgconfig'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end