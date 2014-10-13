require 'formula'
require 'json'

class BorisPackagedendropy312 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/boris/package_dendropy_3_12
  # Tool Shed Readme:
  #    DendroPy is a Python library for phylogenetic computing.
  #                    DendroPy is a pure-Python library with no dependencies, and runs under any version of Python 2 from 2.4 upwards
  #                    (i.e., Python 2.4, 2.5, 2.6, 2.7, etc.). At present, it does not run under Python 3.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://pypi.python.org/packages/source/D/DendroPy/DendroPy-3.12.0.tar.gz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/lib/python"
    system "export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python && python setup.py install --home #{prefix} --install-scripts #{prefix}/bin" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end