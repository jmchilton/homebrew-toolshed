require 'formula'
require 'json'

class DevteamPackager2150 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_r_2_15_0
  # Tool Shed Readme:
  #    
  #                    The precompiled versions of this package were built 2014-03-06.
  #                    R is a free software environment for statistical computing and graphics.
  #                    NOTE: See custom compilation options above.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/x86_64/R/R-2.15.0-Darwin-x86_64.tgz"
    sha1 ""
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/x86_64/R/R-2.15.0-Linux-x86_64.tgz"
    sha1 ""
  else
    url "http://cran.rstudio.com/src/base/R-2/R-2.15.0.tar.gz"
    sha1 ""
  end
  
  if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  else
    depends_on "jmchilton/toolshed/devteam_packagereadline62"
    depends_on "jmchilton/toolshed/devteam_packagelibpng167"
    depends_on "jmchilton/toolshed/devteam_packagecairo11214"
    depends_on "jmchilton/toolshed/devteam_packagepixman0324"
    depends_on "jmchilton/toolshed/devteam_packagefreetype252"
  end
  def install
    environment_actions = []
    if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
      environment_actions += [{'action'=> 'set', 'variable'=> 'R_DOC_DIR', 'value'=> '$KEG_ROOT/lib/R/doc'},{'action'=> 'set', 'variable'=> 'R_HOME_DIR', 'value'=> '$KEG_ROOT/lib/R'},{'action'=> 'set', 'variable'=> 'R_INCLUDE_DIR', 'value'=> '$KEG_ROOT/lib/R/include'},{'action'=> 'set', 'variable'=> 'R_SHARE_DIR', 'value'=> '$KEG_ROOT/lib/R/share'},{'action'=> 'set', 'variable'=> 'R_ROOT_DIR', 'value'=> '$KEG_ROOT'},{'action'=> 'set', 'variable'=> 'R_HOME', 'value'=> '$KEG_ROOT/lib/R'},{'action'=> 'set', 'variable'=> 'RHOME', 'value'=> '$KEG_ROOT/lib/R'},{'action'=> 'set', 'variable'=> 'R_LIBS', 'value'=> '$KEG_ROOT/lib/R/library'}]
    elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      environment_actions += [{'action'=> 'set', 'variable'=> 'TCL_LIBRARY', 'value'=> '$KEG_ROOT/lib/libtcl8.4.so'},{'action'=> 'set', 'variable'=> 'TK_LIBRARY', 'value'=> '$KEG_ROOT/lib/libtk8.4.so'}]
      # Tool Shed set environment variable that is picked implicitly.
      environment_actions += [{'action'=> 'set', 'variable'=> 'R_DOC_DIR', 'value'=> '$KEG_ROOT/lib/R/doc'},{'action'=> 'set', 'variable'=> 'R_HOME_DIR', 'value'=> '$KEG_ROOT/lib/R'},{'action'=> 'set', 'variable'=> 'R_INCLUDE_DIR', 'value'=> '$KEG_ROOT/lib/R/include'},{'action'=> 'set', 'variable'=> 'R_SHARE_DIR', 'value'=> '$KEG_ROOT/lib/R/share'},{'action'=> 'set', 'variable'=> 'R_ROOT_DIR', 'value'=> '$KEG_ROOT'},{'action'=> 'set', 'variable'=> 'R_HOME', 'value'=> '$KEG_ROOT/lib/R'},{'action'=> 'set', 'variable'=> 'RHOME', 'value'=> '$KEG_ROOT/lib/R'},{'action'=> 'set', 'variable'=> 'R_LIBS', 'value'=> '$KEG_ROOT/lib/R/library'}]
    else
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
./configure --with-tcltk \
--with-blas \
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
      system "sed -i.bak 's;#{prefix};\${R_ROOT_DIR};g' #{prefix}/bin/R" 
      system "sed -i.bak 's;#{prefix};\${R_ROOT_DIR};g' #{prefix}/lib/R/bin/R" 
      # Tool Shed set environment variable that is picked implicitly.
      environment_actions += [{'action'=> 'set', 'variable'=> 'R_DOC_DIR', 'value'=> '$KEG_ROOT/lib/R/doc'},{'action'=> 'set', 'variable'=> 'R_HOME_DIR', 'value'=> '$KEG_ROOT/lib/R'},{'action'=> 'set', 'variable'=> 'R_INCLUDE_DIR', 'value'=> '$KEG_ROOT/lib/R/include'},{'action'=> 'set', 'variable'=> 'R_SHARE_DIR', 'value'=> '$KEG_ROOT/lib/R/share'},{'action'=> 'set', 'variable'=> 'R_ROOT_DIR', 'value'=> '$KEG_ROOT'},{'action'=> 'set', 'variable'=> 'R_HOME', 'value'=> '$KEG_ROOT/lib/R'},{'action'=> 'set', 'variable'=> 'RHOME', 'value'=> '$KEG_ROOT/lib/R'},{'action'=> 'set', 'variable'=> 'R_LIBS', 'value'=> '$KEG_ROOT/lib/R/library'}]
    end
    environment(environment_actions)
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end