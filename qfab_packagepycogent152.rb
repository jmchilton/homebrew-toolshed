require 'formula'
require 'json'

class QfabPackagepycogent152 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/qfab/package_pycogent_1_5_2
  # Tool Shed Readme:
  #    It is required to install a numpy python package (here numpy python package version 1.8.1) before installing the pycogent package.
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://sourceforge.net/projects/pycogent/files/PyCogent/1.5.2/PyCogent-1.5.2.tgz/download"
  sha1 ""
  
  depends_on "jmchilton/toolshed/qfab_packagenumpy18"
  def install
    system "mkdir", "-p", "#{prefix}/cogent"
    # Skipping set_environment_for_install command, handled by platform brew.
    system "
                        python setup.py build_ext -if
                    " 
    system "mkdir", "-p", "#{prefix}/cogent/"
    mv Dir["cogent/*"], "#{prefix}/cogent/" 
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT'},{'action'=> 'set', 'variable'=> 'PATH_PYCOGENT', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$ENV[PYTHONPATH_NUMPY]'},{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$ENV[PATH_NUMPY]'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end