require 'formula'
require 'json'

class IucPackageexpat21 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_expat_2_1
  # Tool Shed Readme:
  #    Compiling expat requires make and a C compiler. You can access expat with $EXPAT_ROOT_DIR. http://expat.sourceforge.net/
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://downloads.sourceforge.net/project/expat/expat/2.1.0/expat-2.1.0.tar.gz"
  sha1 ""
  
  def install
    onoe("Unhandled tool shed action [autoconf] encountered.")
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'set', 'variable'=> 'EXPAT_ROOT_DIR', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end