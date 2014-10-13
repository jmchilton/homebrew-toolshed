require 'formula'
require 'json'

class IucPackageghostscript907 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_ghostscript_9_07
  # Tool Shed Readme:
  #    Compiling ghostscript requires a C (typically gcc). GHOSTSCRIPT_SHARE will be exported. http://www.ghostscript.com/
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.ghostscript.com/public/ghostscript-9.07.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/devteam_packagelibx11150"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "
                    ./configure --x-includes=$X11_INCLUDE_DIR --x-libraries=$X11_LIB_DIR --prefix=#{prefix}
                " 
    system "make && make install" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'GHOSTSCRIPT_SHARE', 'value'=> '$KEG_ROOT/share'},{'action'=> 'set', 'variable'=> 'GHOSTSCRIPT_PATH', 'value'=> '$KEG_ROOT/share'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end