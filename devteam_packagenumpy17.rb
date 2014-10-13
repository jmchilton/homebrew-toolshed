require 'formula'
require 'json'

class DevteamPackagenumpy17 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_numpy_1_7
  # Tool Shed Readme:
  #    Compiling numpy requires a C and Fortran compiler (typically gcc and gfortran). The PYTHONPATH for numpy can be accessed through PYTHONPATH_NUMPY.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://pypi.python.org/packages/source/n/numpy/numpy-1.7.1.tar.gz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/lib/python"
    system "export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python && python setup.py install --home #{prefix} --install-scripts #{prefix}/bin" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'append', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'set', 'variable'=> 'PYTHONPATH_NUMPY', 'value'=> '$KEG_ROOT/lib/python'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end