require 'formula'
require 'json'

class BigtiandmBoostgraph < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/big-tiandm/boost_graph
  # Tool Shed Readme:
  #    This package install libwww CPAN package for Perl, including LWP::UserAgent.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.cpan.org/authors/id/D/DB/DBURDICK/BoostGraph/Boost-Graph-1.4.tar.gz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/lib/perl5"
    system <<-EOF
perl Makefile.PL INSTALL_BASE=#{prefix} &&
ls &&
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