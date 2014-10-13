require 'formula'
require 'json'

class IucPackageeigen31 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_eigen_3_1
  # Tool Shed Readme:
  #    Downloading  and compiling the eigen3 library and unpacking it to the EIGEN3_SOURCE_PATH. EIGEN3_INCLUDE_PATH and EIGEN3_LIB_PATH will be available.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://bitbucket.org/eigen/eigen/get/3.1.3.tar.gz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/unpacked_source"
    system "cp -r * #{prefix}/unpacked_source" 
    system "mkdir", "-p", "build"
    cd 'build'
    system "cmake .. -DCMAKE_INSTALL_PREFIX=#{prefix}/eigen3/" 
    system "make install"
    environment([{'action'=> 'set', 'variable'=> 'EIGEN3_SOURCE_PATH', 'value'=> '$KEG_ROOT/unpacked_source'},{'action'=> 'set', 'variable'=> 'EIGEN3_INCLUDE_PATH', 'value'=> '$KEG_ROOT/eigen3/include'},{'action'=> 'set', 'variable'=> 'EIGEN3_LIB_PATH', 'value'=> '$KEG_ROOT/eigen3/lib'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end