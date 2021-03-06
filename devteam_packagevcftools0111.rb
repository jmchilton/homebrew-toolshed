require 'formula'
require 'json'

class DevteamPackagevcftools0111 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_vcftools_0_1_11
  # Tool Shed Readme:
  #    
  #                A set of tools written in Perl and C++ for working with VCF files, such as those generated by the 1000 Genomes Project
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/vcftools/vcftools_0.1.11.tar.gz"
  sha1 ""
  
  def install
    environment_actions = []
    system "make" 
    system "PREFIX=\"#{prefix}/vcftools\" make install" 
    system "cp bin/vcftools #{prefix}/vcftools/bin" 
    environment_actions += [{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/vcftools/bin'}]
    environment_actions += [{'action'=> 'prepend', 'variable'=> 'PERL5LIB', 'value'=> '$KEG_ROOT/vcftools/lib/perl5/site_perl'}]
    environment(environment_actions)
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end