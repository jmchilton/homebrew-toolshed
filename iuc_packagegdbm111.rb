require 'formula'
require 'json'

class IucPackagegdbm111 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_gdbm_1_11
  # Tool Shed Readme:
  #    
  #                GNU dbm (or GDBM, for short) is a library of database functions that use extensible hashing and work similar to the standard UNIX dbm. 
  #                These routines are provided to a programmer needing to create and manipulate a hashed database.
  #                http://www.gnu.org.ua/software/gdbm/gdbm.html
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://ftp.gnu.org/gnu/gdbm/gdbm-1.11.tar.gz"
  sha1 ""
  
  def install
    onoe("Unhandled tool shed action [autoconf] encountered.")
    environment([{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'set', 'variable'=> 'GDBM_ROOT_PATH', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end