require 'formula'
require 'json'

class IucPackageperl518 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_perl_5_18
  # Tool Shed Readme:
  #    
  #                Perl 5 is a highly capable, feature-rich programming language with over 25 years of development.
  #                http://www.perl.org/
  #                
  #                This repository contains local-lib and cpanm in addition.
  #                It is recommended to use something like "cpanm --local-lib=$PERL_LOCALLIB_DIR XML::Parser" to install additional perl modules.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.cpan.org/src/5.0/perl-5.18.1.tar.gz"
  sha1 ""
  resource 'local-lib-1.008009' do
    url "http://www.cpan.org/authors/id/A/AP/APEIRON/local-lib-1.008009.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'cpanm' do
    url "https://raw.github.com/miyagawa/cpanminus/c0c88f71118ecec334d62ba280e883933e7a6d39/cpanm", :using => :nounzip
    sha1 ""
  end
  
  def install
    system "./Configure -des -Dprefix=#{prefix}" 
    system "make install"
    cd '..'
    resource('local-lib-1.008009').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    system "tar xfvz local-lib-1.008009.tar.gz" 
    cd 'local-lib-1.008009'
    system "#{prefix}/bin/perl Makefile.PL --bootstrap=#{prefix}/local-lib/ --no-manpages" 
    system "make install" 
    system "eval $(#{prefix}/bin/perl -I#{prefix}/local-lib/perl5 -Mlocal::lib=#{prefix}/local-lib)" 
    cd '..'
    resource('cpanm').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    system "export PERL5LIB=#{prefix}/lib/perl5/:$PERL5LIB ; export PATH=#{prefix}/bin/:$PATH ; cat cpanm | perl - App::cpanminus" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PERL5LIB', 'value'=> '$KEG_ROOT/lib/perl5'},{'action'=> 'set', 'variable'=> 'PERL_ROOT_DIR', 'value'=> '$KEG_ROOT'},{'action'=> 'set', 'variable'=> 'PERL_LOCALLIB_DIR', 'value'=> '$KEG_ROOT/local-lib'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end