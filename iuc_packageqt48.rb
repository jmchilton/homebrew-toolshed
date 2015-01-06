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
  
  def install
    system "./configure -prefix #{prefix} -opensource -confirm-license -no-xinerama -no-xinput -no-xcursor -no-xvideo -no-opengl -no-sm -no-xkb -no-gui -no-cups -no-openvg -no-xrandr -no-xrender -nomake examples -nomake demos" 
    system "./bin/qmake -r QT_BUILD_PARTS=\"libs tools\"" 
    system "make install"
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'QT_ROOT_DIR', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib/'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/lib/pkgconfig'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end