require 'formula'
require 'json'

class Crs4Sspace < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/crs4/sspace
  # Tool Shed Readme:
  #    
  #    Configuration: Previously (until Release 0), the SSPACE_SITE_OPTIONS variable in the installed env.sh file was used to adjust the number of threads to use in Bowtie alignment (-T). This is not used anymore and may be removed.
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.baseclear.com/download.php?file_id=1038"
  sha1 ""
  
  def install
    system "sed -i -e 's/require \"getopts.pl\"/use Getopt::Std/' -e 's/&Getopts/getopts/' SSPACE_Basic_v2.0.pl" 
    prefix.install Dir["./*"]
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end