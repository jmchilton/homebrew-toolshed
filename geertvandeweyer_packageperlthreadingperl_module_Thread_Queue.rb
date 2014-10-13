require 'formula'
require 'json'

class GeertvandeweyerPackageperlthreadingperlModuleThreadQueue < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/geert-vandeweyer/package_perl_threading
  # Tool Shed Readme:
  #    This package install Thread::Queue CPAN package for Perl.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://search.cpan.org/CPAN/authors/id/J/JD/JDHEDDEN/Thread-Queue-3.02.tar.gz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/lib/perl5"
    system <<-EOF
export PERL5LIB=$PERL5LIB:#{prefix}/lib/perl5	&&
perl Makefile.PL INSTALL_BASE=#{prefix} &&
make &&
make install
EOF
    environment([{'action'=> 'append', 'variable'=> 'PERL5LIB', 'value'=> '$KEG_ROOT/lib/perl5/'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end