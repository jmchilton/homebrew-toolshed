require 'formula'
require 'json'

class IucPackagex11client15proto70 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_x11_client_1_5_proto_7_0
  # Tool Shed Readme:
  #    Xlib is an X Window System protocol client library written in the C programming language. It contains functions for interacting with an X server. These functions allow programmers to write programs without knowing the details of the protocol. Few applications use Xlib directly; rather, they employ other libraries that use Xlib functions to provide widget toolkits.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://ftp.x.org/pub/X11R7.7/src/proto/xproto-7.0.23.tar.bz2"
  sha1 ""
  resource 'libX11-1.5.0.tar.bz2' do
    url "ftp://ftp.x.org/pub/X11R7.7/src/lib/libX11-1.5.0.tar.bz2"
    sha1 ""
  end
  
  def install
    environment_actions = []
    system "./configure --prefix=#{prefix}" 
    system "make && make install" 
    environment_actions += [{'action'=> 'set', 'variable'=> 'X11_INCLUDE_DIR', 'value'=> '$KEG_ROOT/include'}]
    resource('libX11-1.5.0.tar.bz2').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["../*"]
    end
    cd 'libX11-1.5.0'
    system "./configure --prefix=#{prefix} CFLAGS='-I#{prefix}/include'" 
    system "make && make install" 
    environment_actions += [{'action'=> 'set', 'variable'=> 'X11_LIB_DIR', 'value'=> '$KEG_ROOT/lib'}]
    environment(environment_actions)
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end