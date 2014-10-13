require 'formula'
require 'json'

class JankanisBlast2html < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/jankanis/blast2html
  # Tool Shed Readme:
  #    A Python 2 virtual environment that includes the python packages blast2html depends on, which are lxml and jinja2.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  depends_on "jmchilton/toolshed/jankanis_packagelibxml2291"
  depends_on "jmchilton/toolshed/devteam_packagelibxslt1128"
  depends_on "jmchilton/toolshed/iuc_packagezlib128"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "
	  #{prefix}/venv/bin/pip install lxml==3.3.5
	" 
    environment([{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$ENV[LD_LIBRARY_PATH]'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end