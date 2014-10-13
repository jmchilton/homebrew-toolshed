require 'formula'
require 'json'

class DevteamPackageemboss500 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_emboss_5_0_0
  # Tool Shed Readme:
  #    
  #    These links provide information for building the Emboss package in most environments.
  #    
  #    System requirements
  #    http://emboss.sourceforge.net/download/#Requirements
  #    
  #    Platform-dependent notes
  #    http://emboss.sourceforge.net/download/#Platforms
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  if OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/i386/emboss/emboss-5.0.0-Linux-i686.tgz"
    sha1 ""
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/linux/x86_64/emboss/emboss-5.0.0-Linux-x86_64.tgz"
    sha1 ""
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
    url "http://depot.galaxyproject.org/package/darwin/x86_64/emboss/emboss-5.0.0-Darwin-x86_64.tgz"
    sha1 ""
  else
    url "ftp://emboss.open-bio.org/pub/EMBOSS/old/5.0.0/EMBOSS-5.0.0.tar.gz"
    sha1 ""
    resource 'PHYLIP-3.6b' do
      url "ftp://emboss.open-bio.org/pub/EMBOSS/old/5.0.0/PHYLIP-3.6b.tar.gz"
      sha1 ""
    end
  end
  
  if OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
  elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
  elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
  else
    depends_on "jmchilton/toolshed/devteam_packagelibx11150"
    depends_on "jmchilton/toolshed/devteam_packagelibgd210"
    depends_on "jmchilton/toolshed/devteam_packagelibxproto7023"
    depends_on "jmchilton/toolshed/devteam_packagelibxcb191"
  end
  def install
    if OS.linux? and Hardware.is_32_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
      environment([{'action'=> 'set', 'variable'=> 'EMBOSS_ACDROOT', 'value'=> '$KEG_ROOT/share/EMBOSS/acd'},{'action'=> 'set', 'variable'=> 'EMBOSS_DATA', 'value'=> '$KEG_ROOT/share/EMBOSS/data'},{'action'=> 'set', 'variable'=> 'PLPLOT_LIB', 'value'=> '$KEG_ROOT/share/EMBOSS'}])
    elsif OS.linux? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
      environment([{'action'=> 'set', 'variable'=> 'EMBOSS_ACDROOT', 'value'=> '$KEG_ROOT/share/EMBOSS/acd'},{'action'=> 'set', 'variable'=> 'EMBOSS_DATA', 'value'=> '$KEG_ROOT/share/EMBOSS/data'},{'action'=> 'set', 'variable'=> 'PLPLOT_LIB', 'value'=> '$KEG_ROOT/share/EMBOSS'}])
    elsif OS.mac? and Hardware.is_64_bit? and !build.without?("architecture")
      prefix.install Dir["./*"]
      # Tool Shed set environment variable that is picked implicitly.
      environment([{'action'=> 'set', 'variable'=> 'EMBOSS_ACDROOT', 'value'=> '$KEG_ROOT/share/EMBOSS/acd'},{'action'=> 'set', 'variable'=> 'EMBOSS_DATA', 'value'=> '$KEG_ROOT/share/EMBOSS/data'},{'action'=> 'set', 'variable'=> 'PLPLOT_LIB', 'value'=> '$KEG_ROOT/share/EMBOSS'}])
    else
      # Skipping set_environment_for_install command, handled by platform brew.
      system <<-EOF
export LDFLAGS="-L$XCB_LIBS -lm"
export CFLAGS="-I$XPROTO_INCLUDES" && \
./configure --prefix=#{prefix} \
--x-includes=$X11_INCLUDE_DIR \
--x-libraries=$X11_LIB_DIR \
--with-pngdriver=$GD_ROOT
EOF
      system "make && make install" 
      resource('PHYLIP-3.6b').stage do
          # Tool Shed would download inside build directory instead of its own - so move download.
          buildpath.install Dir["../*"]
      end
      cd 'PHYLIP-3.6b'
      system <<-EOF
export LDFLAGS="-L$XCB_LIBS -lm"
export CFLAGS="-I$XPROTO_INCLUDES" && \
./configure --prefix=#{prefix} \
--x-includes=$X11_INCLUDE_DIR \
--x-libraries=$X11_LIB_DIR \
--with-pngdriver=$GD_ROOT
EOF
      system "make && make install" 
      # Tool Shed set environment variable that is picked implicitly.
      environment([{'action'=> 'set', 'variable'=> 'EMBOSS_ACDROOT', 'value'=> '$KEG_ROOT/share/EMBOSS/acd'},{'action'=> 'set', 'variable'=> 'EMBOSS_DATA', 'value'=> '$KEG_ROOT/share/EMBOSS/data'},{'action'=> 'set', 'variable'=> 'PLPLOT_LIB', 'value'=> '$KEG_ROOT/share/EMBOSS'}])
    end
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end