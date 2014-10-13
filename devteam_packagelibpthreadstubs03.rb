require 'formula'
require 'json'

class DevteamPackagelibpthreadstubs03 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_libpthread_stubs_0_3
  # Tool Shed Readme:
  #    The libpthread-stubs package provides weak aliases for pthread functions not provided in libc or otherwise available by default. This is useful for libraries that rely on pthread stubs to use pthreads optionally. On Linux, all necessary pthread functions are available, so this package is simply a placeholder.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://xcb.freedesktop.org/dist/libpthread-stubs-0.3.tar.bz2"
  sha1 ""
  
  def install
    system "./configure --prefix=#{prefix}" 
    system "make && make install" 
    environment([{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/lib/pkgconfig'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end