require 'formula'
require 'json'

class IucPackagefreetype24 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_freetype_2_4
  # Tool Shed Readme:
  #    Compiling freetype requires a C compiler (typically gcc).
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/freetype/freetype2/2.4.11/freetype-2.4.11.tar.bz2"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix}/freetype/" 
    system "make" 
    system "make install" 
    environment([{'action'=> 'append', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/freetype/bin/'},{'action'=> 'set', 'variable'=> 'FREETYPE_LIB_DIR', 'value'=> '$KEG_ROOT/freetype/lib/'},{'action'=> 'set', 'variable'=> 'FREETYPE_INCLUDE_DIR', 'value'=> '$KEG_ROOT/freetype/include/'},{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/freetype/lib'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/freetype/include'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/freetype/include'},{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/freetype/lib/pkgconfig'},{'action'=> 'set', 'variable'=> 'FREETYPE_LIB_PATH', 'value'=> '$KEG_ROOT/freetype/lib'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end