require 'formula'
require 'json'

class IucPackageopenbabel23 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_openbabel_2_3
  # Tool Shed Readme:
  #    Compiling OpenBabel requires g++ and CMake 2.4+. Optional but required for a few features are the cairo development libraries. OPENBABEL_INCLUDE_DIR and OPENBABEL_LIB_DIR can be accessed from other tool wrappers.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/openbabel/openbabel/2.3.2/openbabel-2.3.2.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packageeigen31"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "cmake . -DPYTHON_BINDINGS=ON -DCMAKE_INSTALL_PREFIX=#{prefix} -DEIGEN3_INCLUDE_DIR=$EIGEN3_SOURCE_PATH -DPYTHON_LIBRARY=`python -c 'import distutils.sysconfig; print \"%s/libpython%s.so\" % (distutils.sysconfig.get_config_var(\"LIBPL\"), distutils.sysconfig.get_python_version())'`" 
    system "make" 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'set', 'variable'=> 'BABEL_DATADIR', 'value'=> '$KEG_ROOT/share/openbabel'},{'action'=> 'set', 'variable'=> 'BABEL_LIBDIR', 'value'=> '$KEG_ROOT/lib/openbabel/2.3.2'},{'action'=> 'set', 'variable'=> 'OPENBABEL_LIB_DIR', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'set', 'variable'=> 'OPENBABEL_INCLUDE_DIR', 'value'=> '$KEG_ROOT/include'},{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib/'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end