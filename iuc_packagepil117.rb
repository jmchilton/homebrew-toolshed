require 'formula'
require 'json'

class IucPackagepil117 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_pil_1_1_7
  # Tool Shed Readme:
  #    
  #                Installation of the Python Imaging Library (PIL).
  #                http://www.pythonware.com/products/pil/
  #                The installation can be accessed via PIL_PATH.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/bgruening/download_store/raw/master/pil/Imaging-1.1.7.tar.gz"
  sha1 ""
  
  def install
    system <<-EOF
export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python &&
python setup.py install --install-lib #{prefix}/lib/python --install-scripts #{prefix}/bin
EOF
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'set', 'variable'=> 'PIL_PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end