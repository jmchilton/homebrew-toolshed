require 'formula'
require 'json'

class DevteamPackagefreetype252 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_freetype_2_5_2
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://download.savannah.gnu.org/releases/freetype/freetype-2.5.2.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/devteam_packagelibpng167"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "export LDFLAGS=\"-Wl,-rpath,$LIBPNG_ROOT/lib\" && ./configure --prefix=#{prefix}" 
    system "make install"
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'FREETYPE_LIB_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/lib/pkgconfig'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end