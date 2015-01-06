require 'formula'

class BigtiandmDegseq < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/big-tiandm/degseq
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  # Each homebrew formula must have at least one download, tool shed doesn't require this so hacking in hello source download.
  url "http://ftpmirror.gnu.org/hello/hello-2.9.tar.gz"
  sha1 "cb0470b0e8f4f7768338f5c5cfe1688c90fbbc74"
  
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "R CMD BATCH $REPOSITORY_INSTALL_DIR/install_DEG.R " 
    system "echo \"export PATH=$PATH\" > #{prefix}/env.sh " 
    system "chmod 755 #{prefix}/env.sh " 
  end
end