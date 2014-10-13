require 'formula'
require 'json'

class DevteamPackagefontconfig2111 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_fontconfig_2_11_1
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.freedesktop.org/software/fontconfig/release/fontconfig-2.11.1.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/devteam_packagefreetype252"
  depends_on "jmchilton/toolshed/devteam_packagelibxml2291"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "export LDFLAGS=\"-Wl,-rpath,$FREETYPE_LIB_PATH -L$FREETYPE_LIB_PATH\" && ./configure --prefix=#{prefix} --disable-docs --enable-libxml2" 
    system "make install"
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'FONTCONFIG_ROOT_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'set', 'variable'=> 'FONTCONFIG_FILE', 'value'=> '$KEG_ROOT/etc/fonts/fonts.conf'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end