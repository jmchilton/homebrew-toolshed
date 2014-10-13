require 'formula'
require 'json'

class IucPackagetpp463 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_tpp_4_6_3
  # Tool Shed Readme:
  #    
  #                Installs and compiles the trans proteomic pipeline in version 4.6.3
  #                The Trans-Proteomic Pipeline (TPP) is a collection of integrated tools for MS/MS proteomics, developed at the SPC.
  #    
  #                http://tools.proteomecenter.org/
  #    
  #                PATH will be set.
  #                TPP_ROOT_PATH will point to the root path of the installation.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://dl.dropbox.com/u/226794/TPP-4.6.3.tgz", :using => :nounzip
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagelibgd21"
  depends_on "jmchilton/toolshed/iuc_packagelibpng12"
  depends_on "jmchilton/toolshed/iuc_packagebzlib10"
  depends_on "jmchilton/toolshed/iuc_packageperl518"
  depends_on "jmchilton/toolshed/iuc_packageexpat21"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "eval $(perl -I$PERL_LOCALLIB_DIR/lib/perl5 -Mlocal::lib=$PERL_LOCALLIB_DIR); cpanm --local-lib=$PERL_LOCALLIB_DIR --configure-args=\"EXPATLIBPATH=$EXPAT_ROOT_DIR/lib EXPATINCPATH=$EXPAT_ROOT_DIR/include\" XML::Parser" 
    system "eval $(perl -I$PERL_LOCALLIB_DIR/lib/perl5 -Mlocal::lib=$PERL_LOCALLIB_DIR); cpanm --local-lib=$PERL_LOCALLIB_DIR --configure-args=\"EXPATLIBPATH=$EXPAT_ROOT_DIR/lib EXPATINCPATH=$EXPAT_ROOT_DIR/include\" CGI --force" 
    resource('TPP-4.6.3').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    system "tar -zxf TPP-4.6.3.tgz" 
    system "sed -i.orig 's/endform/end_form/' TPP-4.6.3/trans_proteomic_pipeline/CGI/tpp_gui/tpp_gui.pl" 
    cd './TPP-4.6.3/trans_proteomic_pipeline/src/'
    system "echo \"TPP_ROOT=#{prefix}/\" > Makefile.config.incl" 
    system "echo \"TPP_WEB=/tpp/\" >> Makefile.config.incl" 
    system "echo \"XSLT_PROC=/usr/bin/xsltproc\" >> Makefile.config.incl" 
    system "echo \"CGI_USER_DIR=#{prefix}/cgi-bin/\" >> Makefile.config.incl" 
    system "sed -i -e 's/qw(.*) /(&) /' ../CGI/show_nspbin.pl" 
    system "sed -i -e 's/qw(.*) /(&) /' ../perl/exporTPP.pl" 
    system "echo '' > ../perl/tpp_models.pl" 
    system "eval $(perl -I$PERL_LOCALLIB_DIR/lib/perl5 -Mlocal::lib=$PERL_LOCALLIB_DIR); make; make install" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'TPP_ROOT_PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end