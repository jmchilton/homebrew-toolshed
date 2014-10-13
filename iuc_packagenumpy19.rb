require 'formula'
require 'json'

class IucPackagenumpy19 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_numpy_1_9
  # Tool Shed Readme:
  #    Compiling numpy requires a C and Fortran compiler (typically gcc and gfortran). The PYTHONPATH for numpy can be accessed through PYTHONPATH_NUMPY and the binaries with PATH_NUMPY.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://pypi.python.org/packages/source/n/numpy/numpy-1.9.0.tar.gz#md5=510cee1c6a131e0a9eb759aa2cc62609"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/lib/python"
    system <<-EOF
export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python &&
python setup.py install --install-lib #{prefix}/lib/python --install-scripts #{prefix}/bin
EOF
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'set', 'variable'=> 'PYTHONPATH_NUMPY', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'set', 'variable'=> 'PATH_NUMPY', 'value'=> '$KEG_ROOT/bin'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end