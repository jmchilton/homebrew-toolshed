require 'formula'
require 'json'

class IucPackagelibyaml015 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_libyaml_0_1_5
  # Tool Shed Readme:
  #    
  #                LibYAML is a YAML 1.1 parser and emitter written in C. 
  #                http://pyyaml.org/wiki/LibYAML
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://pyyaml.org/download/libyaml/yaml-0.1.5.tar.gz"
  sha1 ""
  
  def install
    onoe("Unhandled tool shed action [autoconf] encountered.")
    environment([{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'set', 'variable'=> 'LIBYAML_ROOT_PATH', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end