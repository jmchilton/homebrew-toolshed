require 'formula'
require 'json'

class IucPackageqt48 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_qt_4_8
  # Tool Shed Readme:
  #    
  #                Installing Qt libraries. A C++ compiler, usually g++, is requiered.
  #                http://qt-project.org/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://download.qt-project.org/official_releases/qt/4.8/4.8.6/qt-everywhere-opensource-src-4.8.6.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/devteam_packagelibx11150"
  depends_on "jmchilton/toolshed/devteam_packagelibxextproto721"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "./configure -prefix #{prefix} -opensource -confirm-license -no-xinerama -no-xinput -no-xcursor -no-xvideo -no-opengl -no-sm -no-xkb -no-gui -no-cups -no-openvg -no-xrandr -no-xrender" 
    system "make sub-src" 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'append', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'set', 'variable'=> 'QT_ROOT_DIR', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib/'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end