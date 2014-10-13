require 'formula'
require 'json'

class BgrueningDeeptoolsucscTools < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/bgruening/deeptools
  # Tool Shed Readme:
  #    The tools downloaded by this dependency definition are free for academic use. TODO: UCSC tools are only available with their latest version. That is not good for reproducibility.
  
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
    onoe("Unhandled tool shed action [download_binary] encountered.")
    onoe("Unhandled tool shed action [download_binary] encountered.")
    onoe("Unhandled tool shed action [download_binary] encountered.")
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end