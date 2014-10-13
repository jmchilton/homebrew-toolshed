require 'formula'
require 'json'

class ModencodedccMacs2 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/modencode-dcc/macs2
  # Tool Shed Readme:
  #    Macs2 depends on having python2.7 installed on all nodes of the work cluster
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://data.modencode.org/modENCODE_Galaxy/tarballs/macs2pkg.tar"
  sha1 ""
  
  def install
    bin.install Dir["bin/*"]
    system "mkdir", "-p", "#{prefix}/lib"
    mv Dir["lib/*"], "#{prefix}/lib" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python2.7/site-packages'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end