require 'formula'

class DevteamPackagetophat140 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_tophat_1_4_0
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/x86_64/tophat/tophat-1.4.0.Linux_x86_64.tar.gz"
    sha1 ""
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/x86_64/tophat/tophat-1.4.0.OSX_x86_64.tar.gz"
    sha1 ""
  else
    url "http://tophat.cbcb.umd.edu/downloads/tophat-1.4.0.tar.gz"
    sha1 ""
  end
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  else
    depends_on "jmchilton/toolshed/devteam_packagesamtools0118"
  end
  def install
    if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      bin.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      bin.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    else
      # Skipping set_environment_for_install command, handled by platform brew.
      system "./configure --prefix=#{prefix} --with-bam=$BAM_ROOT" 
      system "make && make install" 
      # Tool Shed set environment variable that is picked implicitly.
    end
  end
end