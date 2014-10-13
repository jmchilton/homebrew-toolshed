require 'formula'
require 'json'

class IucPackagepandas014 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_pandas_0_14
  # Tool Shed Readme:
  #    
  #                Pandas is an open source, BSD-licensed library providing high-performance, easy-to-use data structures and data analysis tools for the Python programming language.
  #                The PYTHONPATH for pandas can be accessed through PYTHONPATH_PANDAS.
  #                http://pandas.pydata.org/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://pypi.python.org/packages/source/p/pandas/pandas-0.14.1.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagenumpy17"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "mkdir", "-p", "#{prefix}/lib/python"
    system <<-EOF
export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python &&
export PATH=$PATH:$PATH_NUMPY &&
export PYTHONPATH=$PYTHONPATH:$PYTHONPATH_NUMPY &&
python setup.py install --install-lib #{prefix}/lib/python
EOF
    environment([{'action'=> 'append', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'append', 'variable'=> 'PYTHONPATH', 'value'=> '$ENV[PYTHONPATH_NUMPY]'},{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$ENV[PATH_NUMPY]'},{'action'=> 'set', 'variable'=> 'PYTHONPATH_PANDAS', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'set', 'variable'=> 'PANDAS_ROOT_PATH', 'value'=> '$KEG_ROOT/lib/python'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end