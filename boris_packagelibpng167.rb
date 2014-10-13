require 'formula'
require 'json'

class BorisPackagelibpng167 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/boris/package_libpng_1_6_7
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/libpng/libpng16/older-releases/1.6.7/libpng-1.6.7.tar.gz"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix}" 
    system "make install"
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/lib/pkgconfig'},{'action'=> 'set', 'variable'=> 'PNG_LIBS', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'set', 'variable'=> 'PNG_INCLUDES', 'value'=> '$KEG_ROOT/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end