require 'formula'
require 'json'

class IucPackagechemfp11 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_chemfp_1_1
  # Tool Shed Readme:
  #    
  #            The core chemfp functionality does not depend on a third-party library but you will need a chemistry toolkit in order to generate new fingerprints 
  #            from structure files. chemfp supports the free Open Babel and RDKit toolkits and the proprietary OEChem toolkit.
  #            Currently the Galaxy-wrappers are using openbabel and rdkit as underlying toolkit.
  #            Compiling chemfp requires gcc and a python2.5+ version.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://chem-fingerprints.googlecode.com/files/chemfp-1.1p1.tar.gz"
  sha1 ""
  resource 'simsearch.py' do
    url "http://share.gruenings.eu/simsearch.py", :using => :nounzip
    sha1 ""
  end
  
  def install
    system "mkdir", "-p", "#{prefix}/lib/python"
    system <<-EOF
export PYTHONPATH=$PYTHONPATH:#{prefix}/lib/python &&
python setup.py install --install-lib #{prefix}/lib/python --install-scripts #{prefix}/bin
EOF
    resource('simsearch.py').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    system "rm #{prefix}/lib/python/chemfp/commandline/simsearch.py" 
    system "mkdir", "-p", "#{prefix}/lib/python/chemfp/commandline/"
    mv "simsearch.py", "#{prefix}/lib/python/chemfp/commandline/"
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'append', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end