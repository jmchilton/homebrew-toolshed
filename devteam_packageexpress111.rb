require 'formula'

class DevteamPackageexpress111 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_express_1_1_1
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://bio.math.berkeley.edu/eXpress/downloads/express-1.1.1/express-1.1.1-linux_x86_64.tgz"
    sha1 ""
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://bio.math.berkeley.edu/eXpress/downloads/express-1.1.1/express-1.1.1-macosx_x86_64.tgz"
    sha1 ""
  else
    url "http://bio.math.berkeley.edu/eXpress/downloads/express-1.1.1/express-1.1.1-src.tgz"
    sha1 ""
  end
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  else
  end
  def install
    if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      bin.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      bin.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
    else
      system "cmake src -DCMAKE_INSTALL_PREFIX:PATH=#{prefix}" 
      system "make && make install" 
      # Tool Shed set environment variable that is picked implicitly.
    end
  end
end