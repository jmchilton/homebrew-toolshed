require 'formula'
require 'json'

class IucPackagescikitlearn015 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_scikit_learn_0_15
  # Tool Shed Readme:
  #    
  #                Compiling scikit-learn requires a C compiler (typically gcc). 
  #                The PYTHONPATH for scikit-learn can be accessed through PYTHONPATH_SCIKIT_LEARN.
  #                
  #                Wrapper development: https://github.com/bgruening/galaxytools/tree/master/orphan_tool_dependencies
  #                
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://pypi.python.org/packages/source/s/scikit-learn/scikit-learn-0.15.2.tar.gz#md5=d9822ad0238e17b382a3c756ea94fe0d"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagenumpy19"
  depends_on "jmchilton/toolshed/iuc_packagescipy014"
  depends_on "jmchilton/toolshed/iuc_packagematplotlib14"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "mkdir", "-p", "#{prefix}/lib/python"
    onoe("Unhandled tool shed action [template_command] encountered.")
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$KEG_ROOT/lib/python'},{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$ENV[PYTHONPATH_NUMPY]'},{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$ENV[PATH_NUMPY]'},{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$ENV[PYTHONPATH_SCIPY]'},{'action'=> 'prepend', 'variable'=> 'PATH', 'value'=> '$ENV[PATH_SCIPY]'},{'action'=> 'prepend', 'variable'=> 'PYTHONPATH', 'value'=> '$ENV[PYTHONPATH_MATPLOTLIB]'},{'action'=> 'set', 'variable'=> 'PYTHONPATH_SCIKIT_LEARN', 'value'=> '$KEG_ROOT/lib/python'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end