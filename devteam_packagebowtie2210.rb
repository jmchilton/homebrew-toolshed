require 'formula'
require 'json'

class DevteamPackagebowtie2210 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_bowtie2_2_1_0
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/x86_64/bowtie2/bowtie2-2.1.0-linux-x86_64.tgz"
    sha1 ""
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/x86_64/bowtie2/bowtie2-2.1.0-macos-x86_64.tgz"
    sha1 ""
  elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/i386/bowtie2/bowtie2-2.1.0-linux-i386.tgz"
    sha1 ""
  elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/i386/bowtie2/bowtie2-2.1.0-macos-i386.tgz"
    sha1 ""
  else
    url "http://downloads.sourceforge.net/project/bowtie-bio/bowtie2/2.1.0/bowtie2-2.1.0-source.zip"
    sha1 ""
  end
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
  else
  end
  def install
    if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    else
      system "make" 
      prefix.install "bowtie2"
      prefix.install "bowtie2-align"
      prefix.install "bowtie2-build"
      prefix.install "bowtie2-inspect"
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