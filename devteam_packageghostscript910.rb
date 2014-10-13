require 'formula'

class DevteamPackageghostscript910 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_ghostscript_9_10
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/x86_64/ghostscript/ghostscript-9.10-Darwin-x86_64.tgz"
    sha1 ""
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/x86_64/ghostscript/ghostscript-9.10-linux-x86_64.tgz"
    sha1 ""
  else
    url "http://downloads.ghostscript.com/public/ghostscript-9.10.tar.gz"
    sha1 ""
  end
  
  if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  else
    depends_on "jmchilton/toolshed/devteam_packagelibx11150"
  end
  def install
    if OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    else
      # Skipping set_environment_for_install command, handled by platform brew.
      system "./configure --prefix=#{prefix}" 
      system "make && make install" 
      # Tool Shed set environment variable that is picked implicitly.
    end
  end
end