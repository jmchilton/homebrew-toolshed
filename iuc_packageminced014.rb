require 'formula'
require 'json'

class IucPackageminced014 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_minced_0_1_4
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/ctSkennerton/minced/releases/download/0.1.4/minced", :using => :nounzip
  sha1 ""
  resource 'minced.j' do
    url "https://github.com/ctSkennerton/minced/releases/download/0.1.4/minced.jar", :using => :nounzip
    sha1 ""
  end
  
  def install
    resource('minced.j').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
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