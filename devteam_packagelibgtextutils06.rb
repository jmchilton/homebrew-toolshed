require 'formula'
require 'json'

class DevteamPackagelibgtextutils06 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_libgtextutils_0_6
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://depot.galaxyproject.org/package/source/fastx_toolkit/libgtextutils-0.6.tar.bz2"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix} --disable-wall" 
    system "make && make install" 
    environment([{'action'=> 'set', 'variable'=> 'GTEXTUTILS_CFLAGS', 'value'=> '$KEG_ROOT/include/gtextutils'},{'action'=> 'set', 'variable'=> 'GTEXTUTILS_LIBS', 'value'=> '$KEG_ROOT/lib -lgtextutils'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end