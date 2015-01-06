require 'formula'
require 'json'

class PjbriggsPalfinderpalFinder < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/pjbriggs/pal_finder
  # Tool Shed Readme:
  #    pal_finder also needs Perl
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://sourceforge.net/projects/palfinder/files/pal_finder_v0.02.04.tar.gz"
  sha1 ""
  
  def install
    environment_actions = []
    bin.install "pal_finder_v0.02.04.pl"
    system "mkdir", "-p", "#{prefix}/data"
    mv "config.txt", "#{prefix}/data"
    system "mkdir", "-p", "#{prefix}/data"
    mv "simple.ref", "#{prefix}/data"
    # Tool Shed set environment variable that is picked implicitly.
    environment_actions += [{'action'=> 'set', 'variable'=> 'PALFINDER_SCRIPT_DIR', 'value'=> '$KEG_ROOT/bin'}]
    environment_actions += [{'action'=> 'set', 'variable'=> 'PALFINDER_DATA_DIR', 'value'=> '$KEG_ROOT/data'}]
    environment(environment_actions)
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end