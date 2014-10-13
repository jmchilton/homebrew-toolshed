require 'formula'
require 'json'

class DevteamPackageblastplus2226 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_blast_plus_2_2_26
  # Tool Shed Readme:
  #    
  #    These links provide information for building the NCBI Blast+ package in most environments.
  #    
  #    System requirements
  #    http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastDocs&DOC_TYPE=Download
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.26/ncbi-blast-2.2.26+-universal-macosx.tar.gz"
    sha1 ""
  elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
    url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.26/ncbi-blast-2.2.26+-universal-macosx.tar.gz"
    sha1 ""
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.26/ncbi-blast-2.2.26+-x64-linux.tar.gz"
    sha1 ""
  elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
    url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.26/ncbi-blast-2.2.26+-ia32-linux.tar.gz"
    sha1 ""
  elsif OS.linux? and !build.without?("architecture")
    url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.26/ncbi-blast-2.2.26+-ia32-linux.tar.gz"
    sha1 ""
  else
    url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.26/ncbi-blast-2.2.26+-src.tar.gz"
    sha1 ""
  end
  
  if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
  elsif OS.linux? and !build.without?("architecture")
  else
  end
  def install
    if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["bin/*"]
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
      prefix.install Dir["bin/*"]
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["bin/*"]
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
      prefix.install Dir["bin/*"]
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.linux? and !build.without?("architecture")
      prefix.install Dir["bin/*"]
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    else
      system "cd c++ && ./configure --prefix=#{prefix} && make && make install" 
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    end
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end