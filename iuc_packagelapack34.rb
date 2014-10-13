require 'formula'
require 'json'

class IucPackagelapack34 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_lapack_3_4
  # Tool Shed Readme:
  #    LAPACK requires gcc and gfortran. LAPACK_LIB_DIR will be set (including liblapack.a and libblas.a). 
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.netlib.org/lapack/lapack-3.4.2.tgz"
  sha1 ""
  
  def install
    system "sed 's/^OPTS\s.*/OPTS     = -O2 -fPIC/g' INSTALL/make.inc.gfortran  | sed  's/^NOOPT\s.*/OPTS     = -O2 -fPIC/g'  > make.inc" 
    system "mkdir build" 
    system "cd build && cmake .. -DCMAKE_INSTALL_PREFIX=#{prefix}/lapack" 
    system "cd build && make" 
    system "cd build && make install" 
    environment([{'action'=> 'set', 'variable'=> 'LAPACK_LIB_DIR', 'value'=> '$KEG_ROOT/lapack/lib'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end