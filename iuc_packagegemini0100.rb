require 'formula'
require 'json'

class IucPackagegemini0100 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_gemini_0_10_0
  # Tool Shed Readme:
  #    Compiling GEMINI requires a recent c++ compiler, usually gcc.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://raw.github.com/arq5x/gemini/master/gemini/scripts/gemini_install.py", :using => :nounzip
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagezlib128"
  depends_on "jmchilton/toolshed/iuc_packagegrabix013"
  depends_on "jmchilton/toolshed/iuc_packagetabix026"
  depends_on "jmchilton/toolshed/iuc_packagesamtools0119"
  depends_on "jmchilton/toolshed/iuc_packagebedtools219"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "
                    python gemini_install.py #{prefix} #{prefix} --nosudo --nodata --notools --gemini-version 0.10.0
                " 
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/anaconda/bin'},{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/gemini/bin'},{'action'=> 'set', 'variable'=> 'GEMINI_ROOT_DIR', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end