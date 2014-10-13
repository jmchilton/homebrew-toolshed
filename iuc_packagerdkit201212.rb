require 'formula'
require 'json'

class IucPackagerdkit201212 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_rdkit_2012_12
  # Tool Shed Readme:
  #    Compiling rdkit requires cmake, python headers, sqlite3, flex and bison.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/rdkit/rdkit/Q4_2012/RDKit_2012_12_1.tgz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagenumpy17"
  depends_on "jmchilton/toolshed/iuc_packageboost153"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system <<-EOF
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`pwd`/lib/ &&
export PYTHONPATH=$PYTHONPATH:`pwd`/ &&
mkdir build &&
cd build &&
cmake .. -DBOOST_ROOT=$BOOST_ROOT_DIR -DCMAKE_INSTALL_PREFIX=#{prefix}/rdkit/ -DRDK_INSTALL_INTREE=OFF -DPYTHON_NUMPY_INCLUDE_PATH=$PYTHONPATH_NUMPY/numpy/core/include/
EOF
    system "cd ./build && make " 
    system "cd ./build && make install" 
    environment([{'action'=> 'set', 'variable'=> 'RDBASE', 'value'=> '$KEG_ROOT/rdkit'},{'action'=> 'append', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/rdkit/lib/'},{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/rdkit/bin'},{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/rdkit/lib/python2.7/site-packages/'},{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/rdkit/lib64/python2.7/site-packages/'},{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$ENV[PYTHONPATH_NUMPY]'},{'action'=> 'append', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$ENV[BOOST_ROOT_DIR]/lib/'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end