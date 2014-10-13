require 'formula'
require 'json'

class BorisPackagereadline62 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/boris/package_readline_6_2
  # Tool Shed Readme:
  #    The GNU Readline library provides a set of functions for use by applications that allow users to edit command lines as they are typed in.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://ftp.gnu.org/gnu/readline/readline-6.2.tar.gz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}"
    system "./configure --prefix=#{prefix}" 
    system "make install"
    environment([{'action'=> 'set', 'variable'=> 'READLINE_LIBS', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'set', 'variable'=> 'READLINE_INCLUDES', 'value'=> '$KEG_ROOT/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end