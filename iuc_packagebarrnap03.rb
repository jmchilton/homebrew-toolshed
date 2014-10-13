require 'formula'
require 'json'

class IucPackagebarrnap03 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_barrnap_0_3
  # Tool Shed Readme:
  #    
  #    Dependencies of Barrnap which needs to be installed separately:
  #    - Perl core modules: FindBin, Time::Piece.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://www.vicbioinformatics.com/barrnap-0.3.tar.gz"
  sha1 ""
  
  def install
    prefix.install Dir["./*"]
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end