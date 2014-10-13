require 'formula'
require 'json'

class SaketchoudharyPackageblas350 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/saket-choudhary/package_blas_3_5_0
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.netlib.org/blas/blas.tgz"
  sha1 ""
  
  def install
    system "gfortran -O3 -std=legacy -m64 -fno-second-underscore -fPIC -c *.f" 
    system "ar rv libblas.a *.o" 
    environment([{'action'=> 'set', 'variable'=> 'BLAS_PATH', 'value'=> '$KEG_ROOT/libblas.a'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end