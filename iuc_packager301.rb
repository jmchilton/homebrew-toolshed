require 'formula'
require 'json'

class IucPackager301 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_r_3_0_1
  # Tool Shed Readme:
  #    R is a free software environment for statistical computing and graphics. http://www.r-project.org/
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://cran.ms.unimelb.edu.au/src/base/R-3/R-3.0.1.tar.gz"
  sha1 ""
  
  def install
    system "
                    ./configure --with-readline=no --enable-R-shlib  --with-x=no --libdir=#{prefix}/lib/ --bindir=#{prefix}/bin/ --datarootdir=#{prefix}/share/
                " 
    system "make" 
    system "make install" 
    environment([{'action'=> 'set', 'variable'=> 'R_HOME', 'value'=> '$KEG_ROOT/lib/R'},{'action'=> 'set', 'variable'=> 'R_LIBS', 'value'=> '$KEG_ROOT/lib/R/library'},{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/lib/R/bin'},{'action'=> 'append', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib/R/lib'},{'action'=> 'set', 'variable'=> 'RHOME', 'value'=> '$KEG_ROOT/lib/R'},{'action'=> 'set', 'variable'=> 'R_PATH', 'value'=> '$KEG_ROOT/lib/R/bin'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end