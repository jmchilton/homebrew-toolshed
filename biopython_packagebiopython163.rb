require 'formula'
require 'json'

class BiopythonPackagebiopython163 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/biopython/package_biopython_1_63
  # Tool Shed Readme:
  #    
  #    This Galaxy Tool Shed package installs Biopython from source, having
  #    first installed NumPy which is a build time depencency. This requires
  #    and assumes a standard C compiler is already installed, along with
  #    the Python header files.
  #    
  #    Development of this dependency definition is being done here on GitHub:
  #    https://github.com/biopython/galaxy_packages
  #    
  #    The PYTHONPATH for biopython can be accessed through PYTHONPATH_BIOPYTHON.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://pypi.python.org/packages/source/b/biopython/biopython-1.63.tar.gz"
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
    environment([{'action'=> 'append', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'append', 'variable'=> 'PYTHONPATH', 'value'=> '$ENV[PYTHONPATH_NUMPY]'},{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$ENV[PATH_NUMPY]'},{'action'=> 'set', 'variable'=> 'PYTHONPATH_BIOPYTHON', 'value'=> '$KEG_ROOT/lib/python'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end