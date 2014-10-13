require 'formula'
require 'json'

class DevteamPackagelibxslt1128 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_libxslt_1_1_28
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://xmlsoft.org/libxml2/libxslt-1.1.28.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/devteam_packagelibxml2291"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "./configure --prefix=#{prefix}" 
    system "make && make install" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/lib/pkgconfig'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end