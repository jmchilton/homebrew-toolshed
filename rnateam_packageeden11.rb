require 'formula'
require 'json'

class RnateamPackageeden11 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/rnateam/package_eden_1_1
  # Tool Shed Readme:
  #    Compiling EDeN requires a C++ compiler, usually g++.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/bgruening/download_store/raw/master/EDeN/EDeN-1.1.0.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagezlib128"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "make" 
    system "mkdir", "-p", "#{prefix}/bin/"
    mv "EDeN", "#{prefix}/bin/"
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'append', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$ENV[BOOST_ROOT_DIR]/lib/'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end