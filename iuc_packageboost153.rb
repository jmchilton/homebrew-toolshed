require 'formula'
require 'json'

class IucPackageboost153 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_boost_1_53
  # Tool Shed Readme:
  #    Compiling boost requires a C++ compiler (typically gcc). You can access the boost root directory through the $BOOST_ROOT_DIR system variable. All modules will be build.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/boost/boost/1.53.0/boost_1_53_0.tar.bz2"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagebzlib10"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "./bootstrap.sh" 
    system "./bjam address-model=64 cflags=-fPIC cxxflags=-fPIC install --prefix=#{prefix}/boost/ -sBZIP2_INCLUDE=$BZLIB_INCLUDE_DIR -sBZIP2_LIB=$BZLIB_LIB_DIR -sBZIP2_SOURCE=$BZLIB_SOURCE_DIR" 
    environment([{'action'=> 'set', 'variable'=> 'BOOST_ROOT_DIR', 'value'=> '$KEG_ROOT/boost'},{'action'=> 'append', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/boost/lib/'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/boost/include'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/boost/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end