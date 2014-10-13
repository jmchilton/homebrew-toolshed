require 'formula'
require 'json'

class IucPackageblat35x1 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_blat_35x1
  # Tool Shed Readme:
  #    
  #    BLAT sequence aligner from the UCSC: http://genome.ucsc.edu/FAQ/FAQblat.html
  #    Git development repository: http://genome-source.cse.ucsc.edu/gitweb/?p=kent.git
  #    
  #    Please note that the BLAT source and executables are freely available for
  #    academic, nonprofit and personal use. Commercial licensing information is
  #    available on the Kent Informatics website (http://www.kentinformatics.com/).
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  depends_on "jmchilton/toolshed/devteam_packagelibpng167"
  def install
    system "git clone git://genome-source.cse.ucsc.edu/kent.git blat" 
    system "git reset --hard 84614918e462d7750a8f56e5ce9540c623b87b48" 
    # Skipping set_environment_for_install command, handled by platform brew.
    system "export HOME=#{prefix} && export MACHTYPE=`uname -m` && export PNGINCL=-I${LIBPNG_ROOT}/include && export PNGLIB=\"-L${LIBPNG_ROOT}/lib -lpng\" && mkdir -p $HOME/bin/$MACHTYPE && make -C src/lib/ && make -C src/jkOwnLib/ && make -C src/blat/ && mv #{prefix}/bin/$MACHTYPE/* #{prefix}/bin/ && rm -rf #{prefix}/.ccache/" 
    environment([{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/bin/'},{'action'=> 'set', 'variable'=> 'BLAT_PATH', 'value'=> '$KEG_ROOT'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end