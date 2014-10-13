require 'formula'
require 'json'

class IucPackagelibpng12 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_libpng_1_2
  # Tool Shed Readme:
  #    Provides the 1.2.x branch of libpng for compatibility with older software. Compiling libpng requires make and a C compiler. http://www.libpng.org/pub/png/libpng.html
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://download.sourceforge.net/libpng/libpng-1.2.51.tar.gz"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix}" 
    system "make && make install" 
    environment([{'action'=> 'prepend', 'variable'=> 'LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'set', 'variable'=> 'LIBPNG_ROOT', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/lib/pkgconfig'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end