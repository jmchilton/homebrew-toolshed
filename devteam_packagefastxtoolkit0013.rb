require 'formula'

class DevteamPackagefastxtoolkit0013 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_fastx_toolkit_0_0_13
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/x86_64/fastx_toolkit/0.0.13.tar.bz2"
    sha1 ""
  elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/i386/fastx_toolkit/0.0.13.tar.bz2"
    sha1 ""
  elsif OS.linux? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/i386/fastx_toolkit/0.0.13.tar.bz2"
    sha1 ""
  elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/i386/fastx_toolkit/0.0.13.tar.bz2"
    sha1 ""
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/x86_64/fastx_toolkit/0.0.13.tar.bz2"
    sha1 ""
  else
    url "http://depot.galaxyproject.org/package/source/fastx_toolkit/fastx_toolkit-0.0.13.tar.bz2"
    sha1 ""
  end
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
  elsif OS.linux? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  else
    depends_on "jmchilton/toolshed/devteam_packagelibgtextutils06"
  end
  def install
    if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      bin.install Dir["./bin/*"]
      # Tool Shed set environment variable that is picked implicitly.
    elsif OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
      bin.install Dir["./bin/*"]
      # Tool Shed set environment variable that is picked implicitly.
    elsif OS.linux? and !build.without?("architecture")
      bin.install Dir["./bin/*"]
      # Tool Shed set environment variable that is picked implicitly.
    elsif OS.mac? and Hardware.is_32_bit? and !build.without?("architecture")
      bin.install Dir["./bin/*"]
      # Tool Shed set environment variable that is picked implicitly.
    elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      bin.install Dir["./bin/*"]
      # Tool Shed set environment variable that is picked implicitly.
    else
      # Skipping set_environment_for_install command, handled by platform brew.
      system "./configure --prefix=#{prefix} --disable-wall" 
      system "make && make install" 
      # Tool Shed set environment variable that is picked implicitly.
    end
  end
end