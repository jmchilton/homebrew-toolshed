require 'formula'
require 'json'

class IucPackagetrnascan131 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_trnascan_1_3_1
  # Tool Shed Readme:
  #    Compiling and running tRNAScan-SE requires gcc a PERL environment.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://lowelab.ucsc.edu/software/tRNAscan-SE.tar.gz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/bin/"
    system "mkdir", "-p", "#{prefix}/lib/tRNAscan-SE/"
    system "mkdir", "-p", "#{prefix}/man/"
    system "sed 's%^BINDIR  = .*%BINDIR = #{prefix}/bin/%' Makefile | sed 's%^LIBDIR  = .*%LIBDIR = #{prefix}/lib/tRNAscan-SE/%' | sed 's%^MANDIR  = .*%MANDIR = #{prefix}/man%' > Makefile_new" 
    system "rm Makefile && mv Makefile_new Makefile" 
    system "make install"
    system "wget ftp://selab.janelia.org/pub/software/infernal/infernal-1.0.2.tar.gz" 
    system "tar xfvz infernal-1.0.2.tar.gz" 
    system "cd infernal-1.0.2 && ./configure --prefix=#{prefix} && make && make install" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PERL5LIB', 'value'=> '$KEG_ROOT/bin/'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end