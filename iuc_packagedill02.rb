require 'formula'
require 'json'

class IucPackagedill02 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_dill_0_2
  # Tool Shed Readme:
  #    
  #                    The PYTHONPATH for dill can be accessed through PYTHONPATH_DILL and the binaries with PATH_DILL.
  #                    http://www.cacr.caltech.edu/~mmckerns/dill.htm
  #                
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://pypi.python.org/packages/source/d/dill/dill-0.2.1.tgz#md5=66f4d8fff8724568bde03e421bf520bb"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/lib/python"
    system <<-EOF
export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python &&
python setup.py install --install-lib #{prefix}/lib/python --install-scripts #{prefix}/bin
EOF
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'set', 'variable'=> 'PYTHONPATH_DILL', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'set', 'variable'=> 'PATH_DILL', 'value'=> '$KEG_ROOT/bin'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end