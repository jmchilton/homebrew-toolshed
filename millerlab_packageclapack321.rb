require 'formula'
require 'json'

class MillerlabPackageclapack321 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/miller-lab/package_clapack_3_2_1
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.netlib.org/clapack/clapack-3.2.1.tgz"
  sha1 ""
  
  def install
    system "cp make.inc.example make.inc" 
    system "make f2clib" 
    system "make blaslib" 
    system "make lib" 
    system "cp -R INCLUDE #{prefix}" 
    system "mkdir -p #{prefix}/F2CLIBS" 
    system "cp F2CLIBS/*.a #{prefix}/F2CLIBS" 
    system "cp *.a #{prefix}" 
    environment([{'action'=> 'set', 'variable'=> 'CLAPACKPATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end