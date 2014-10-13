require 'formula'

class IucPackagegnused422sandbox < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_gnu_sed_4_2_2_sandbox
  # Tool Shed Readme:
  #    
  #                Compiling GNU sed requires a C compiler and the GNU patch utility to add the --sandbox feature from Assaf Gordon.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://ftp.gnu.org/gnu/sed/sed-4.2.2.tar.gz"
  sha1 ""
  resource 'sed-e16266897f646e193a9a1287658a1847d68f1e51_sandbox.patch' do
    url "https://github.com/bgruening/download_store/raw/master/GNU/sed-e16266897f646e193a9a1287658a1847d68f1e51_sandbox.patch", :using => :nounzip
    sha1 ""
  end
  
  def install
    resource('sed-e16266897f646e193a9a1287658a1847d68f1e51_sandbox.patch').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    system "patch -p1 -i sed-e16266897f646e193a9a1287658a1847d68f1e51_sandbox.patch" 
    system "./configure --prefix=#{prefix}" 
    system "make" 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end