require 'formula'
require 'json'

class JjohnsonCdhit < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/jjohnson/cdhit
  # Tool Shed Readme:
  #    
  #    These links provide information for building the cdhit package:
  #    
  #    http://weizhong-lab.ucsd.edu/cd-hit/
  #    
  #    https://code.google.com/p/cdhit/
  #    
  #    https://code.google.com/p/cdhit/source/browse/README
  #    
  #    Change the CDHIT_SITE_OPTIONS variable in the installed env.sh file to adjust 
  #    the maximum memory Mb (-M) or to limit the number of threads (-T)
  #    to match your site 
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://cdhit.googlecode.com/files/cd-hit-v4.6.1-2012-08-27.tgz"
  sha1 ""
  
  def install
    system "make openmp=yes" 
    prefix.install "cd-hit"
    prefix.install "cd-hit-est"
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'},{'action'=> 'set', 'variable'=> 'CDHIT_SITE_OPTIONS', 'value'=> '"-M 4000 -T 0"'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end