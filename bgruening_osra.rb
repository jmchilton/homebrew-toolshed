require 'formula'
require 'json'

class BgrueningOsra < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/bgruening/osra
  # Tool Shed Readme:
  #    We still have a handfull of requirements
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/osra/osra/2.0.0/osra-2.0.0.tgz"
  sha1 ""
  resource 'potrace-1.11' do
    url "http://potrace.sourceforge.net/download/potrace-1.11.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'gocr-0.50pre-patched' do
    url "http://downloads.sourceforge.net/project/osra/gocr-patched/gocr-0.50pre-patched.tgz", :using => :nounzip
    sha1 ""
  end
  resource 'tclap-1.2.1' do
    url "http://downloads.sourceforge.net/project/tclap/tclap-1.2.1.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'ocrad-0.21' do
    url "http://mirror.checkdomain.de/gnu/ocrad/ocrad-0.21.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'cuneiform-linux-1.1.0.tar.bz2' do
    url "https://launchpad.net/cuneiform-linux/1.1/1.1/+download/cuneiform-linux-1.1.0.tar.bz2", :using => :nounzip
    sha1 ""
  end
  
  depends_on "jmchilton/toolshed/iuc_packageopenbabel23"
  depends_on "jmchilton/toolshed/iuc_packagegraphicsmagick13"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    resource('potrace-1.11').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    system "tar xfvz potrace-1.11.tar.gz && cd potrace-1.11 && ./configure --with-libpotrace --prefix=#{prefix}/potrace/build && make && make install" 
    resource('gocr-0.50pre-patched').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    system "tar xfvz gocr-0.50pre-patched.tgz && cd gocr-0.50pre-patched && ./configure --prefix=#{prefix}/gocr/build && make libs && make all install" 
    resource('tclap-1.2.1').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    system "tar xfvz tclap-1.2.1.tar.gz && cd tclap-1.2.1 && ./configure --prefix=#{prefix}/tclap/build && make && make install" 
    resource('ocrad-0.21').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    system "tar xfvz ocrad-0.21.tar.gz && cd ocrad-0.21 && ./configure --prefix=#{prefix}/ocrad/build && make && make install" 
    resource('cuneiform-linux-1.1.0.tar.bz2').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    system "tar xfvj cuneiform-linux-1.1.0.tar.bz2 && cd cuneiform-linux-1.1.0 && mkdir build && cd build && cmake .. -DCMAKE_INSTALL_PREFIX=#{prefix}/cuneiform/build/ && make && make install" 
    system <<-EOF
export PATH=$PATH:$GRAPHICSMAGICK_ROOT_DIR/bin/ &&
./configure --with-tclap-include=#{prefix}/tclap/build/include/ --with-potrace-include=#{prefix}/potrace/build/include/ --with-potrace-lib=#{prefix}/potrace/build/lib/ --with-gocr-include=#{prefix}/gocr/build/include/gocr/ --with-gocr-lib=#{prefix}/gocr/build/lib/ --with-ocrad-include=#{prefix}/ocrad/build/include/ --with-ocrad-lib=#{prefix}/ocrad/build/lib/ --with-cuneiform-include=#{prefix}/cuneiform/build/include/ --with-cuneiform --with-cuneiform-lib=#{prefix}/cuneiform/build/install/lib/ --with-openbabel-include=$OPENBABEL_INCLUDE_DIR/openbabel-2.0/ --with-openbabel-lib=$OPENBABEL_LIB_DIR --with-graphicsmagick-lib=$GRAPHICSMAGICK_ROOT_DIR/lib/ --with-graphicsmagick-include=$GRAPHICSMAGICK_ROOT_DIR/include/GraphicsMagick/ --prefix=#{prefix}
EOF
    system "make" 
    system "make install" 
    system "rm #{prefix}/tclap/ -r" 
    system "rm #{prefix}/gocr/ -r" 
    system "rm #{prefix}/ocrad/ -r" 
    system "rm #{prefix}/cuneiform/ -r" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$ENV[GRAPHICSMAGICK_ROOT_DIR]/lib/'},{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/potrace/build/lib/'},{'action'=> 'set', 'variable'=> 'OSRA_DATA_FILES', 'value'=> '$KEG_ROOT/share'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end