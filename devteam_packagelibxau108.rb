require 'formula'
require 'json'

class DevteamPackagelibxau108 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_libxau_1_0_8
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://ftp.x.org/pub/individual/lib/libXau-1.0.8.tar.bz2"
  sha1 ""
  
  depends_on "jmchilton/toolshed/devteam_packagexorgmacros1171"
  depends_on "jmchilton/toolshed/devteam_packagelibxproto7023"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
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