require 'formula'
require 'json'

class IucPackagenetcdf43 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_netcdf_4_3
  # Tool Shed Readme:
  #    
  #                NetCDF (network Common Data Form) is a set of software libraries and machine-independent data formats that support the creation, access, 
  #                and sharing of array-oriented scientific data.
  #                http://www.unidata.ucar.edu/downloads/netcdf/index.jsp
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.3.1.1.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagehdf51812"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    onoe("Unhandled tool shed action [autoconf] encountered.")
    environment([{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'set', 'variable'=> 'NETCDF_ROOT_PATH', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end