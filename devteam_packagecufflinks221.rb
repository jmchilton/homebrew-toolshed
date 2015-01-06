require 'formula'

class DevteamPackagecufflinks221 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_cufflinks_2_2_1
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz"
    sha1 ""
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.OSX_x86_64.tar.gz"
    sha1 ""
  else
    url "http://cufflinks.cbcb.umd.edu/downloads/cufflinks-2.2.1.tar.gz"
    sha1 ""
  end
  
  if OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  else
    depends_on "jmchilton/toolshed/iuc_packageboost153"
    depends_on "jmchilton/toolshed/devteam_packagesamtools0118"
    depends_on "jmchilton/toolshed/devteam_packageeigen320"
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
      system "./configure --prefix=#{prefix} --with-boost=$BOOST_ROOT_DIR --with-bam=$BAM_ROOT --with-eigen=$EIGEN_ROOT" 
      system "make && make install" 
      # Tool Shed set environment variable that is picked implicitly.
    end
  end
end