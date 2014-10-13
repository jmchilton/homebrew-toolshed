require 'formula'
require 'json'

class MillerlabPackagefisher014 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/miller-lab/package_fisher_0_1_4
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://pypi.python.org/packages/source/f/fisher/fisher-0.1.4.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagenumpy17"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "mkdir -p #{prefix}/lib/python" 
    system "PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python:$PYTHONPATH_NUMPY python setup.py install --home #{prefix}" 
    environment([{'action'=> 'append', 'variable'=> 'PYTHONPATH', 'value'=> '$ENV[PYTHONPATH_NUMPY]'},{'action'=> 'append', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end