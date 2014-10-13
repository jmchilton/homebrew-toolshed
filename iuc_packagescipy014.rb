require 'formula'
require 'json'

class IucPackagescipy014 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_scipy_0_14
  # Tool Shed Readme:
  #    Compiling scipy requires a C and Fortran compiler (typically gcc and gfortran). The PYTHONPATH for scipy can be accessed through PYTHONPATH_SCIPY and the binaries with PATH_SCIPY.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://pypi.python.org/packages/source/s/scipy/scipy-0.14.0.tar.gz#md5=d7c7f4ccf8b07b08d6fe49d5cd51f85d"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagenumpy19"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "mkdir", "-p", "#{prefix}/lib/python"
    system <<-EOF
export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python &&
export PATH=$PATH:$PATH_NUMPY &&
export PYTHONPATH=$PYTHONPATH:$PYTHONPATH_NUMPY &&
python setup.py install --install-lib #{prefix}/lib/python --install-scripts #{prefix}/bin
EOF
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$ENV[PYTHONPATH_NUMPY]'},{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$ENV[PATH_NUMPY]'},{'action'=> 'set', 'variable'=> 'PYTHONPATH_SCIPY', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'set', 'variable'=> 'PATH_SCIPY', 'value'=> '$KEG_ROOT/bin'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end