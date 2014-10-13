require 'formula'
require 'json'

class JjohnsonDefusedefuse < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/jjohnson/defuse
  # Tool Shed Readme:
  #    
  #    deFuse code
  #    To build the deFuse toolset you must have the boost c++ development libraries installed. If they are not installed on your system you can download them from the boost website. A full install of boost is not required. The easiest thing to do is to download the latest boost source tar.gz, extract it, then add the extracted path to the CPLUS_INCLUDE_PATH environment variable (in bash, `export CPLUS_INCLUDE_PATH=/boost/directory/:$CPLUS_INCLUDE_PATH`)
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://sourceforge.net/projects/defuse/files/defuse/0.6/defuse-0.6.0.tar.gz"
  sha1 ""
  
  def install
    system "cd tools && make" 
    prefix.install Dir["./*"]
    environment([{'action'=> 'set', 'variable'=> 'DEFUSE_PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end