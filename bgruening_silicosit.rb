require 'formula'
require 'json'

class BgrueningSilicosit < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/bgruening/silicos_it
  # Tool Shed Readme:
  #    Compiling silicos-it requires g++ and CMake 2.4+.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/bgruening/silicos-it_store/raw/master/strip-it/strip-it-1.0.2.tar.gz"
  sha1 ""
  resource 'align-it-1.0.3' do
    url "https://github.com/bgruening/silicos-it_store/raw/master/align-it/align-it-1.0.3.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'shape-it-1.0.1' do
    url "https://github.com/bgruening/silicos-it_store/raw/master/shape-it/shape-it-1.0.1.tar.gz", :using => :nounzip
    sha1 ""
  end
  
  depends_on "jmchilton/toolshed/iuc_packagenumpy17"
  depends_on "jmchilton/toolshed/iuc_packageopenbabel23"
  depends_on "jmchilton/toolshed/iuc_packagerdkit201212"
  def install
    environment_actions = []
    # Skipping set_environment_for_install command, handled by platform brew.
    system <<-EOF
cmake . -DOPENBABEL2_INCLUDE_DIRS=$OPENBABEL_INCLUDE_DIR/openbabel-2.0/ -DCMAKE_INSTALL_PREFIX=#{prefix}/strip-it/ -DOPENBABEL2_LIBRARIES=$OPENBABEL_LIB_DIR/libopenbabel.so &&
make  &&
make install
EOF
    environment_actions += [{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/strip-it/bin'}]
    resource('align-it-1.0.3').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    system <<-EOF
tar xfvz align-it-1.0.3.tar.gz &&
cd align-it-1.0.3 &&
cmake . -DOPENBABEL2_INCLUDE_DIRS=$OPENBABEL_INCLUDE_DIR/openbabel-2.0/ -DCMAKE_INSTALL_PREFIX=#{prefix}/align-it/ -DOPENBABEL2_LIBRARIES=$OPENBABEL_LIB_DIR/libopenbabel.so &&
make &&
make install
EOF
    environment_actions += [{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/align-it/bin'}]
    resource('shape-it-1.0.1').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    system <<-EOF
tar xfvz shape-it-1.0.1.tar.gz &&
cd shape-it-1.0.1 &&
cmake . -DOPENBABEL2_INCLUDE_DIRS=$OPENBABEL_INCLUDE_DIR/openbabel-2.0/ -DCMAKE_INSTALL_PREFIX=#{prefix}/shape-it/ -DOPENBABEL2_LIBRARIES=$OPENBABEL_LIB_DIR/libopenbabel.so &&
make &&
make install
EOF
    environment_actions += [{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$KEG_ROOT/shape-it/bin'}]
    environment(environment_actions)
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end