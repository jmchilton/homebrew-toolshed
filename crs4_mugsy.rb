require 'formula'
require 'json'

class Crs4Mugsy < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/crs4/mugsy
  # Tool Shed Readme:
  #    
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  depends_on "jmchilton/toolshed/iuc_packageboost153"
  def install
    environment_actions = []
    system "svn checkout http://svn.code.sf.net/p/mugsy/code/ mugsy" 
    system "sed -i 's/boost\/property_map\.hpp/boost\/property_map\/property_map.hpp/' trunk/chaining/synchain-mugsy.cpp" 
    system "sed -i 's/boost\/graph\/kolmogorov_max_flow\.hpp/boost\/graph\/boykov_kolmogorov_max_flow.hpp/' trunk/chaining/synchain-mugsy.cpp trunk/mugsy-seqan/projects/library/apps/mugsy/mugsy.cpp" 
    system "sed -i -e 's/-static//g' -e 's/-lbgl-viz -lboost_graph-gcc41-mt//g' trunk/chaining/Makefile" 
    system "sed -i '13 a \#include <algorithm>' trunk/MUMmer3.20/src/tigr/show-diff.cc" 
    system "touch trunk/MUMmer3.20/src/kurtz/streesrc/streeproto.h" 
    system "sed -i -e 's/install synchain-mugsy/install chaining\/synchain-mugsy/' -e 's/install mugsyWGA \(.*\)/install mugsy-seqan\/projects\/library\/apps\/mugsy\/gcc\/mugsy \1\/mugsyWGA/' trunk/Makefile" 
    system "sed -i '/DOC_DIR/d' trunk/MUMmer3.20/Makefile" 
    # Skipping set_environment_for_install command, handled by platform brew.
    system "sed -i -e 's/-I \/usr\/local\/projects\/angiuoli\/boost\/include\/boost-1_38/-I $(BOOST_ROOT_DIR)\/include/g' -e 's/-L \/usr\/local\/projects\/angiuoli\/boost\/lib\//-L $(BOOST_ROOT_DIR)\/lib/g' trunk/chaining/Makefile trunk/mugsy-seqan/platforms/gcc/platform.mak" 
    system "rm -f trunk/chaining/synchain-mugsy trunk/mugsyWGA trunk/synchain-mugsy && make -C trunk/MUMmer3.20 clean" 
    system "make -C trunk all" 
    system "make -C trunk install" 
    prefix.install Dir["trunk/mugsy_x86-64-v1r2.3.1/*"]
    environment_actions += [{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT'}]
    environment_actions += [{'action'=> 'set', 'variable'=> 'MUGSY_INSTALL', 'value'=> '$KEG_ROOT'}]
    environment(environment_actions)
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end