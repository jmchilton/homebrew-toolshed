require 'formula'
require 'json'

class BorisPackager2150 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/boris/package_r_2_15_0
  # Tool Shed Readme:
  #    R is a free software environment for statistical computing and graphics
  #                WARNING: See custom compilation options above
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://cran.rstudio.com/src/base/R-2/R-2.15.0.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/boris_packagereadline62"
  depends_on "jmchilton/toolshed/boris_packagelibpng167"
  depends_on "jmchilton/toolshed/boris_packagecairo11214"
  depends_on "jmchilton/toolshed/boris_packagepixman0324"
  depends_on "jmchilton/toolshed/boris_packagefreetype252"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system <<-EOF
export LDFLAGS="-L$PNG_LIBS -L$READLINE_LIBS" &&
export LDFLAGS="$LDFLAGS -Wl,-rpath,$READLINE_LIBS" &&
export LDFLAGS="$LDFLAGS -Wl,-rpath,$PIXMAN_LIB_PATH" &&
export LDFLAGS="$LDFLAGS -Wl,-rpath,$PNG_LIB_PATH" &&
export LDFLAGS="$LDFLAGS -Wl,-rpath,$FREETYPE_LIB_PATH" &&
export CFLAGS="-I$PNG_INCLUDES -I$READLINE_INCLUDES" &&
export CXXFLAGS="-I$PNG_INCLUDES -I$READLINE_INCLUDES" &&
export CPPFLAGS="-I$PNG_INCLUDES -I$READLINE_INCLUDES" &&
./configure --with-blas \
--with-lapack \
--with-readline \
--with-cairo \
--with-libpng \
--without-x \
--enable-R-shlib \
--disable-R-framework \
--libdir=#{prefix}/lib \
--prefix=#{prefix}
EOF
    system "make install"
    environment([{'action'=> 'set', 'variable'=> 'R_HOME', 'value'=> '$KEG_ROOT/lib/R'},{'action'=> 'set', 'variable'=> 'R_LIBS', 'value'=> '$KEG_ROOT/lib/R/library'},{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/lib/R/bin'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end