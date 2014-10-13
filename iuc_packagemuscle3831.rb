require 'formula'
require 'json'

class IucPackagemuscle3831 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_muscle_3_8_31
  # Tool Shed Readme:
  #    
  #    Downloads the precompiled 32bit Linux, 64bit Linux, or Mac OS X MUSCLE
  #    binaries, which is faster than performing a local compilation,
  #    avoids any issues with build dependencies, and is more reproducible between
  #    installations as there is no variability from the compiler or library 
  #    versions.
  #    If the download attempt fails, compiling MUSCLE from source is attempted.
  #    
  #    For more details, see:
  #    http://www.drive5.com/muscle/manual/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86darwin64.tar.gz"
    sha1 ""
  elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
    url "http://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86darwin32.tar.gz"
    sha1 ""
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86linux64.tar.gz"
    sha1 ""
  elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
    url "http://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86linux32.tar.gz"
    sha1 ""
  else
    url "http://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_src.tar.gz"
    sha1 ""
  end
  
  if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
  else
  end
  def install
    if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      system "mkdir", "-p", "#{prefix}/muscle"
      mv "../muscle3.8.31_i86darwin64", "#{prefix}/muscle"
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
      prefix.install "muscle3.8.31_i86darwin32"
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install "muscle3.8.31_i86linux64"
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
      prefix.install "muscle3.8.31_i86linux32"
      environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
    else
      system "sed -i 's/-static//g' src/mk" 
      system "make -C src/" 
      prefix.install "src/muscle"
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