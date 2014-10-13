require 'formula'
require 'json'

class BgrueningConfab < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/bgruening/confab
  # Tool Shed Readme:
  #    Compiling Confab requires g++, CMake 2.4+. Optional but required for a few features is libxml2 and zlib.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://confab.googlecode.com/files/Confab-1.0.1.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packageeigen20"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "cmake . -DCMAKE_INSTALL_PREFIX=#{prefix} -DEIGEN2_INCLUDE_DIR=$EIGEN2_SOURCE_PATH" 
    system "make" 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'BABEL_DATADIR', 'value'=> '$KEG_ROOT/share/openbabel'},{'action'=> 'set', 'variable'=> 'BABEL_LIBDIR', 'value'=> '$KEG_ROOT/lib/openbabel/2.2.99'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end