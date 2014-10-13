require 'formula'
require 'json'

class LparsonsPackagecutadapt16 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/lparsons/package_cutadapt_1_6
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://pypi.python.org/packages/source/c/cutadapt/cutadapt-1.6.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagecython0201"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "python setup.py install --home #{prefix} --install-scripts #{prefix}/bin" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'append', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end