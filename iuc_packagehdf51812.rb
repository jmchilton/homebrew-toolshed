require 'formula'
require 'json'

class IucPackagehdf51812 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_hdf5_1_8_12
  # Tool Shed Readme:
  #    
  #            HDF5 is a data model, library, and file format for storing and managing data. It supports an unlimited variety of datatypes, and is designed for flexible and efficient I/O and for high volume and complex data. HDF5 is portable and is extensible, allowing applications to evolve in their use of HDF5. The HDF5 Technology suite includes tools and applications for managing, manipulating, viewing, and analyzing data in the HDF5 format. 
  #    
  #            http://www.hdfgroup.org/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/bgruening/download_store/raw/master/hdf5/hdf5-1.8.12.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagezlib128"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    onoe("Unhandled tool shed action [autoconf] encountered.")
    environment([{'action'=> 'prepend', 'variable'=> 'LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'prepend', 'variable'=> 'HDF5_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end