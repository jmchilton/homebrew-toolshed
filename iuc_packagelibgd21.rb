require 'formula'
require 'json'

class IucPackagelibgd21 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_libgd_2_1
  # Tool Shed Readme:
  #    
  #                Installs and complils libdg.
  #                GD is an open source code library for the dynamic creation of images by programmers. 
  #                GD is written in C, and "wrappers" are available for Perl, PHP and other languages. 
  #                GD creates PNG, JPEG, GIF, WebP, XPM, BMP images, among other formats. 
  #                GD is commonly used to generate charts, graphics, thumbnails, and most anything else, on the fly. 
  #                While not restricted to use on the web, the most common applications of GD involve website development.
  #                
  #                http://libgd.bitbucket.org/
  #                
  #                LIBRARY_PATH, LD_LIBRARY_PATH and CPLUS_INCLUDE_PATH will be set.
  #                LIBGD_ROOT_PATH will point to the root path of the installation.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://bitbucket.org/libgd/gd-libgd/downloads/libgd-2.1.0.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/devteam_packagelibpng167"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    onoe("Unhandled tool shed action [autoconf] encountered.")
    environment([{'action'=> 'prepend', 'variable'=> 'LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'set', 'variable'=> 'LIBGD_ROOT_PATH', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/lib/pkgconfig'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end