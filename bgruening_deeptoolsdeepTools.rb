require 'formula'
require 'json'

class BgrueningDeeptoolsdeepTools < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/bgruening/deeptools
  # Tool Shed Readme:
  #    
  #                Installation of deepTools from Fidel Ramirez.
  #                https://github.com/fidelram/deepTools
  #             
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  depends_on "jmchilton/toolshed/iuc_packagesamtools0119"
  depends_on "jmchilton/toolshed/iuc_packagenumpy17"
  depends_on "jmchilton/toolshed/iuc_packagematplotlib12"
  depends_on "jmchilton/toolshed/iuc_packagescipy012"
  depends_on "jmchilton/toolshed/iuc_packagepysam077"
  depends_on "jmchilton/toolshed/iuc_packagebxpython122013"
  def install
    system "git clone --recursive https://github.com/fidelram/deepTools.git" 
    # Skipping set_environment_for_install command, handled by platform brew.
    system "git reset --hard 351890e3db9a443484c5c349791b7247163cc94f" 
    system "mkdir", "-p", "#{prefix}/lib/python"
    system <<-EOF
export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python &&
python setup.py install --install-lib #{prefix}/lib/python --install-scripts #{prefix}/bin
EOF
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'set', 'variable'=> 'DEEP_TOOLS_NO_CONFIG', 'value'=> 'TRUE'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end