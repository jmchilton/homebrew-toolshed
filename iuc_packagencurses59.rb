require 'formula'
require 'json'

class IucPackagencurses59 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_ncurses_5_9
  # Tool Shed Readme:
  #    ncurses (new curses) is a programming library that provides an API which allows the programmer to write text-based user interfaces in a terminal-independent manner
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz"
  sha1 ""
  
  def install
    system "
                    ./configure --prefix #{prefix} --with-shared --enable-symlinks
                " 
    system "make" 
    system "make install" 
    environment([{'action'=> 'set', 'variable'=> 'NCURSES_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'set', 'variable'=> 'NCURSES_LIB_PATH', 'value'=> '$KEG_ROOT/lib/'},{'action'=> 'set', 'variable'=> 'NCURSES_ROOT_PATH', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'prepend', 'variable'=> 'LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end