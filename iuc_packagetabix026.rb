require 'formula'
require 'json'

class IucPackagetabix026 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_tabix_0_2_6
  # Tool Shed Readme:
  #    
  #                Installs tabix version 0.2.6. Available binaries: tabix, bgzip
  #                http://samtools.sourceforge.net/tabix.shtml
  #    
  #                Tabix indexes a TAB-delimited genome position file in.tab.bgz and creates an index file in.tab.bgz.tbi when region is absent from the command-line. 
  #                The input data file must be position sorted and compressed by bgzip which has a gzip(1) like interface. After indexing, 
  #                tabix is able to quickly retrieve data lines overlapping regions specified in the format "chr:beginPos-endPos". 
  #                Fast data retrieval also works over network if URI is given as a file name and in this case the index file will be downloaded if it is not present locally. 
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://sourceforge.net/projects/samtools/files/tabix/tabix-0.2.6.tar.bz2"
  sha1 ""
  
  def install
    system "make" 
    bin.install "tabix"
    bin.install "bgzip"
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'TABIX_BIN_PATH', 'value'=> '$KEG_ROOT/bin'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end