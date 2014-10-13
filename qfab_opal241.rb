require 'formula'
require 'json'

class QfabOpal241 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/qfab/opal2_4_1
  # Tool Shed Readme:
  #    Meme Web Service requires a ZSI and Opal Libraries.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://sourceforge.net/projects/opaltoolkit/files/opal-python/2.4/opal-py-2.4.1.tar.gz/download"
  sha1 ""
  
  def install
    prefix.install Dir["./*"]
    system "mkdir", "-p", "#{prefix}/prereqs/ZSI-lib"
    system <<-EOF
export PYTHONPATH=$PYTHONPATH:#{prefix}/prereqs/ZSI-lib &&
easy_install --install-dir #{prefix}/prereqs/ZSI-lib --script-dir #{prefix}/prereqs/ZSI-lib #{prefix}/prereqs/ZSI-2.1_a2-py2.6.egg
EOF
    environment([{'action'=> 'set', 'variable'=> 'PYTHONPATH_OPAL', 'value'=> '$KEG_ROOT'},{'action'=> 'set', 'variable'=> 'PYTHONPATH_ZSI', 'value'=> '$KEG_ROOT/prereqs/ZSI-lib'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end