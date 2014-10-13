require 'formula'
require 'json'

class JjohnsonPackagecap33 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/jjohnson/package_cap3_3
  # Tool Shed Readme:
  #    
  #    CAP3: A DNA sequence assembly program.
  #    Huang, X. and Madan, A. (1999) CAP3: A DNA sequence assembly program. Genome Res., 9, 868-877.
  #    http://seq.cs.iastate.edu/
  #    
  #    LICENCE:
  #    CAP3 and PCAP are available for use at company under a licensing agreement from Michigan Tech. For information on a licensing agreement, please contact Robin Kolehmainen by email at rakolehm@mtu.edu or by phone at 906-487-2228. Michigan Tech handles licensing agreements on PCAP for Iowa State. 
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://seq.cs.iastate.edu/CAP3/cap3.macosx.intel64.tar"
    sha1 ""
  elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
    url "http://seq.cs.iastate.edu/CAP3/cap3.macosx.intel32.tar"
    sha1 ""
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://seq.cs.iastate.edu/CAP3/cap3.linux.x86_64.tar"
    sha1 ""
  elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
    url "http://seq.cs.iastate.edu/CAP3/cap3.linux.tar"
    sha1 ""
  else
    # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
    url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
    sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  end
  
  if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
  else
  end
  def install
    if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install "cap3"
      prefix.install "formcon"
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
      prefix.install "cap3"
      prefix.install "formcon"
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install "cap3"
      prefix.install "formcon"
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
      prefix.install "cap3"
      prefix.install "formcon"
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    else
      system "echo ERROR: Automated installation on your operating system and CPU architecture combination is not yet supported." 
      system "echo Your machine details (the output from 'uname' and 'arch'):" 
      system "uname" 
      system "arch" 
      system "false" 
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