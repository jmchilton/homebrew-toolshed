require 'formula'
require 'json'

class IucPackagematplotlib14 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_matplotlib_1_4
  # Tool Shed Readme:
  #    Compiling matplotlib requires a C compiler (typically gcc) and libpng.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://pypi.python.org/packages/source/m/matplotlib/matplotlib-1.4.0.tar.gz#md5=1daf7f2123d94745feac1a30b210940c"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagenumpy19"
  depends_on "jmchilton/toolshed/iuc_packagefreetype24"
  depends_on "jmchilton/toolshed/devteam_packagelibpng167"
  depends_on "jmchilton/toolshed/iuc_packagezlib128"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "mkdir", "-p", "#{prefix}/lib/python"
    system <<-EOF
export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python &&
python setup.py install --install-lib #{prefix}/lib/python --install-scripts #{prefix}/bin
EOF
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$ENV[PYTHONPATH_NUMPY]'},{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$ENV[PATH_NUMPY]'},{'action'=> 'set', 'variable'=> 'PYTHONPATH_MATPLOTLIB', 'value'=> '$KEG_ROOT/lib/python'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end