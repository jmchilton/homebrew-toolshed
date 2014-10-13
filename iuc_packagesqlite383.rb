require 'formula'
require 'json'

class IucPackagesqlite383 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_sqlite_3_8_3
  # Tool Shed Readme:
  #    
  #                SQLite is a software library that implements a self-contained, serverless, zero-configuration, transactional SQL database engine. SQLite is the most widely deployed SQL database engine in the world. The source code for SQLite is in the public domain.
  #                http://www.sqlite.org/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/bgruening/download_store/raw/master/sqlite/sqlite-autoconf-3080300.tar.gz"
  sha1 ""
  
  def install
    onoe("Unhandled tool shed action [autoconf] encountered.")
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'set', 'variable'=> 'SQLITE_ROOT_DIR', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end