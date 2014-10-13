require 'formula'
require 'json'

class Crs4Kggseqvariantselection < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/crs4/kggseq_variant_selection
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/nsoranzo/kggseq_archive/archive/v0.4_20140910.tar.gz"
  sha1 ""
  
  def install
    system "touch test.vcf" 
    system "java -jar kggseq.jar --no-lib-check --resource resources --buildver hg19 --db-filter hg19_1kg201305,hg19_1kg201204,hg19_ESP6500AA,hg19_ESP6500EA,hg19_dbsnp141,hg19_dbsnp138,hg19_dbsnp137 --genome-annot --db-gene refgene,gencode,knowngene --db-score dbnsfp --superdup-annot --vcf-file test.vcf" 
    prefix.install Dir["./*"]
    environment([{'action'=> 'set', 'variable'=> 'KGGSEQ_JAR_PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end