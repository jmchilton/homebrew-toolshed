require 'formula'
require 'json'

class QfabPackagemothur < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/qfab/package_mothur
  # Tool Shed Readme:
  #    
  #          Downloads the precompiled 32bit Linux, 64bit Linux, or Mac 64-bit OS X mothur binaries, which is faster than performing a local compliation, avoids any issues with build dependencies, and is more reproducible between installations as there is no variability from the compiler or library versions.
  #          
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://www.mothur.org/w/images/f/fb/Mothur.mac_64.OSX-10.6.zip"
    sha1 ""
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "https://bitbucket.org/qfab/metagenomics/downloads/Mothur.cen_64.zip"
    sha1 ""
  elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
    url "www.mothur.org/w/images/1/13/Mothur.cen.zip"
    sha1 ""
  else
    # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
    url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
    sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  end
  
  if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
  else
  end
  def install
    if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["mothur/*"]
      system "chmod ugo+x #{prefix}/mothur" 
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["mothur/*"]
      system "chmod ugo+x #{prefix}/mothur" 
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
      prefix.install Dir["mothur/*"]
      system "chmod ugo+x #{prefix}/mothur" 
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    else
      system "echo ERROR: Automated installation on your operating system and CPU architecture combination is not yet supported." 
      system "echo \"Your machine details (the output from 'uname' and 'arch'):\"" 
      system "uname" 
      system "arch" 
      system "echo Please report this via support@qfab.org - thank you!" 
      system "false" 
      system "chmod ugo+x #{prefix}/mothur" 
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