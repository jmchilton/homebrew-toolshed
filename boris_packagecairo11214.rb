require 'formula'
require 'json'

class BorisPackagecairo11214 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/boris/package_cairo_1_12_14
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://depot.galaxyproject.org/package/source/cairo/cairo-1.12.14.tar.bz2"
  sha1 ""
  
  depends_on "jmchilton/toolshed/boris_packagepixman0324"
  depends_on "jmchilton/toolshed/boris_packagelibpng167"
  depends_on "jmchilton/toolshed/boris_packagefreetype252"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system <<-EOF
export LDFLAGS="-Wl,-rpath,$PIXMAN_LIB_PATH -Wl,-rpath,$PNG_LIB_PATH -Wl,-rpath,$FREETYPE_LIB_PATH" && \
./configure --prefix=#{prefix} \
--with-x=no \
--enable-xcb-shm=no \
--enable-xlib-xcb=no \
--enable-xcb=no \
--enable-xlib-xrender=no
EOF
    system "make install"
    system "touch #{prefix}/include/cairo/cairo-xlib.h" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'CAIRO_LIB_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/lib/pkgconfig'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end