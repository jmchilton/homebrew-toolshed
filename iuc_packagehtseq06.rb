require 'formula'
require 'json'

class IucPackagehtseq06 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_htseq_0_6
  # Tool Shed Readme:
  #    
  #                Installation of htseq. The installation can be accessed via HTSEQ_ROOT_PATH.
  #                https://pypi.python.org/pypi/HTSeq
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://pypi.python.org/packages/source/H/HTSeq/HTSeq-0.6.1.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagenumpy17"
  depends_on "jmchilton/toolshed/iuc_packagematplotlib12"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "mkdir", "-p", "#{prefix}/lib/python"
    system <<-EOF
export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python &&
python setup.py install --install-lib #{prefix}/lib/python --install-scripts #{prefix}/bin
EOF
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$ENV[PYTHONPATH_NUMPY]'},{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$ENV[PATH_NUMPY]'},{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$ENV[PYTHONPATH_MATPLOTLIB]'},{'action'=> 'set', 'variable'=> 'HTSEQ_ROOT_PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end