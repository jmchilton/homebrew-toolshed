require 'formula'
require 'json'

class IucPackagematplotlib12 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_matplotlib_1_2
  # Tool Shed Readme:
  #    Compiling matplotlib requires a C compiler (typically gcc). To gain addidtiona performance pleae make sure you have ATLAS and BLAS installed.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/matplotlib/matplotlib/matplotlib-1.2.1/matplotlib-1.2.1.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagenumpy17"
  depends_on "jmchilton/toolshed/iuc_packagefreetype24"
  depends_on "jmchilton/toolshed/devteam_packagelibpng167"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "mkdir", "-p", "#{prefix}/lib/python"
    system <<-EOF
export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python:$PYTHONPATH_NUMPY &&
export CPLUS_INCLUDE_PATH=$FREETYPE_INCLUDE_DIR:$FREETYPE_INCLUDE_DIR/freetype2/:${LIBPNG_ROOT}/include &&
export LIBRARY_PATH=$FREETYPE_LIB_DIR:${LIBPNG_ROOT}/lib &&
python setup.py install --install-lib #{prefix}/lib/python --install-scripts #{prefix}/bin
EOF
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$ENV[PYTHONPATH_NUMPY]'},{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$ENV[LIBPNG_ROOT]/lib'},{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$ENV[FREETYPE_LIB_DIR]'},{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$ENV[PATH_NUMPY]'},{'action'=> 'set', 'variable'=> 'PYTHONPATH_MATPLOTLIB', 'value'=> '$KEG_ROOT/lib/python'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end