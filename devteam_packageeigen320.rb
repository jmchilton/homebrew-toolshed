require 'formula'
require 'json'

class DevteamPackageeigen320 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_eigen_3_2_0
  # Tool Shed Readme:
  #    
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://bitbucket.org/eigen/eigen/get/3.2.0.tar.bz2"
  sha1 ""
  
  def install
    system "mkdir", "-p", "build"
    cd 'build'
    system "cmake .. -DCMAKE_INSTALL_PREFIX=#{prefix} -DEIGEN_INCLUDE_INSTALL_DIR=#{prefix}/include" 
    system "make install" 
    environment([{'action'=> 'set', 'variable'=> 'EIGEN_ROOT', 'value'=> '$KEG_ROOT'},{'action'=> 'set', 'variable'=> 'EIGEN3_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end