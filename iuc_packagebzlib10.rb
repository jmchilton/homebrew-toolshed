require 'formula'
require 'json'

class IucPackagebzlib10 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_bzlib_1_0
  # Tool Shed Readme:
  #    Compiling bzlib requires make and a C compiler. You can access bzlib with $BZLIB_LIB_DIR and $BZLIB_INCLUDE_DIR.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz"
  sha1 ""
  
  def install
    system "make" 
    system "make install PREFIX=#{prefix}/bzlib" 
    system "mkdir", "-p", "#{prefix}/bzlib/source"
    mv Dir[".//*"], "#{prefix}/bzlib/source" 
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/bzlib/bin'},{'action'=> 'set', 'variable'=> 'BZLIB_LIB_DIR', 'value'=> '$KEG_ROOT/bzlib/lib'},{'action'=> 'set', 'variable'=> 'BZLIB_INCLUDE_DIR', 'value'=> '$KEG_ROOT/bzlib/include'},{'action'=> 'set', 'variable'=> 'BZLIB_SOURCE_DIR', 'value'=> '$KEG_ROOT/bzlib/source'},{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/bzlib/lib/'},{'action'=> 'prepend', 'variable'=> 'LIBRARY_PATH', 'value'=> '$KEG_ROOT/bzlib/lib/'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/bzlib/include'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/bzlib/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end