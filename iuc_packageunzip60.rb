require 'formula'
require 'json'

class IucPackageunzip60 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_unzip_6_0
  # Tool Shed Readme:
  #    
  #                UnZip is an extraction utility for archives compressed in .zip format (also called "zipfiles"). Although highly compatible both with PKWARE's PKZIP and PKUNZIP utilities for MS-DOS and with Info-ZIP's own Zip program, our primary objectives have been portability and non-MSDOS functionality. 
  #                http://www.info-zip.org/UnZip.html
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz"
  sha1 ""
  
  def install
    system "make -f unix/Makefile generic" 
    system "make -f unix/Makefile prefix=#{prefix} install" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'UNZIP_ROOT_PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end