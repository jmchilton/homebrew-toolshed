require 'formula'
require 'json'

class PritiVdtdependency < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/priti/vdt_dependency
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://bitbucket.org/ambhoreshirish97/softsearch/get/559fa729cc65.zip
		"
  sha1 ""
  
  def install
    system "perl ./install.pl --prefix=#{prefix}" 
    system "export PERL5LIB=$PERL5LIB:#{prefix}:#{prefix}/lib" 
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/src'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end