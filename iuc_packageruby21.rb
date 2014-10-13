require 'formula'
require 'json'

class IucPackageruby21 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_ruby_2_1
  # Tool Shed Readme:
  #    
  #                This installs ruby 2.1.x. Ruby is a dynamic, open source programming language with a focus on simplicity and productivity.
  #                It has an elegant syntax that is natural to read and easy to write.
  #                https://www.ruby-lang.org/
  #    
  #                RUBYHOME and RUBYLIB will be set and with GALAXY_RUBY_HOME you can access the root installation directory.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz"
  sha1 ""
  
  def install
    onoe("Unhandled tool shed action [autoconf] encountered.")
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'RUBYLIB', 'value'=> '$KEG_ROOT/lib/'},{'action'=> 'set', 'variable'=> 'RUBY_HOME', 'value'=> '$KEG_ROOT'},{'action'=> 'set', 'variable'=> 'GALAXY_RUBY_HOME', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end