require 'formula'
require 'json'

class IucFastqc < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/fastqc
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.10.1.zip"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/fastqc_dist"
    mv Dir["../FastQC/*"], "#{prefix}/fastqc_dist" 
    system "chmod ugo+x #{prefix}/fastqc_dist/fastqc" 
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/fastqc_dist'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end