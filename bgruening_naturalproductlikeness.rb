require 'formula'
require 'json'

class BgrueningNaturalproductlikeness < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/bgruening/natural_product_likeness
  # Tool Shed Readme:
  #    Opsin requires a JAVA (1.5+) runtime evironment.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/np-likeness/Natural_Product_Likeness_calculator_2.0.zip"
  sha1 ""
  
  def install
    prefix.install "Natural_Product_Likeness_calculator_2.0/NP-Likeness-2.0.jar"
    environment([{'action'=> 'set', 'variable'=> 'NPLS_JAR_PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end