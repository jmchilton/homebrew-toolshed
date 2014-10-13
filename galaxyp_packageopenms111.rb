require 'formula'
require 'json'

class GalaxypPackageopenms111 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/galaxyp/package_openms_1_11
  # Tool Shed Readme:
  #    
  #                This package downloads and installs OpenMS.
  #                http://open-ms.sourceforge.net/
  #                
  #                Requirements: OpenGL is needed to compile OpenMS. You can find libopengl.so usually in some mesa libraries.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://sourceforge.net/projects/open-ms/files/OpenMS/OpenMS-1.11.1/OpenMS-1.11.1.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagelibtool24"
  depends_on "jmchilton/toolshed/iuc_packageqt48"
  depends_on "jmchilton/toolshed/iuc_packagezlib128"
  depends_on "jmchilton/toolshed/iuc_packagebzlib10"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    cd 'contrib'
    system "cmake . -DBUILD_TYPE=SEQAN" 
    system "cmake . -DBUILD_TYPE=LIBSVM" 
    system "cmake . -DBUILD_TYPE=XERCESC" 
    system "cmake . -DBUILD_TYPE=GSL" 
    system "cmake . -DBUILD_TYPE=BOOST" 
    system "cmake . -DBUILD_TYPE=COINOR" 
    system "cmake . -DBUILD_TYPE=BZIP2" 
    system "cmake . -DBUILD_TYPE=GLPK" 
    cd '..'
    system "cmake . -DINSTALL_PREFIX=#{prefix}" 
    system "make doc_minimal" 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$ENV[QT_ROOT_DIR]/lib/'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end