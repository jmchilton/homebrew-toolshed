require 'formula'
require 'json'

class JjohnsonPackageshear0211 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/jjohnson/package_shear_0_2_11
  # Tool Shed Readme:
  #    
  #    SHEAR: Sample Heterogeneity Estimation and Assembly by Reference
  #    
  #    SHEAR is an assembly tool that accounts for heterogeneous variants by estimating their representative percentages and allowing for selective assembly of sample subpopulations. By utilizing structural variant detection algorithms, SHEAR also offers improved performance in the form of a stronger ability to handle difficult structural variant types and improved computational efficiency.
  #    
  #    http://vk.cs.umn.edu/SHEAR/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://vk.cs.umn.edu/SHEAR/downloads/shear-v0.2.11-compiled.tar.gz"
  sha1 ""
  
  def install
    prefix.install Dir["./*"]
    environment([{'action'=> 'set', 'variable'=> 'SHEAR_JAR_PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end