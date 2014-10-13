require 'formula'
require 'json'

class Crs4Packagepydoop011 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/crs4/package_pydoop_0_11
  # Tool Shed Readme:
  #    
  #    This package requires that Hadoop is already installed and that the 'hadoop' executable is in the PATH.
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/pydoop/Pydoop-0.11/pydoop-0.11.1.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packageopenssl10"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "mkdir", "-p", "#{prefix}/lib/python"
    system "export LIBRARY_PATH=$OPENSSL_ROOT_DIR/lib:$LIBRARY_PATH && export JAVA_HOME=$(readlink -f $(which java)|sed 's|/jre/bin/java$||') && export HADOOP_HOME=$(readlink -f $(which hadoop)|sed 's|/bin/hadoop$||') && export PYTHONPATH=#{prefix}/lib/python:$PYTHONPATH && python setup.py install --prefix=#{prefix} --install-lib=#{prefix}/lib/python" 
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end