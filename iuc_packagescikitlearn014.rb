require 'formula'
require 'json'

class IucPackagescikitlearn014 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_scikit_learn_0_14
  # Tool Shed Readme:
  #    
  #                Compiling scikit-learn requires a C compiler (typically gcc). 
  #                The PYTHONPATH for scikit-learn can be accessed through PYTHONPATH_SCIKIT_LEARN.
  #                
  #                Wrapper development: https://github.com/bgruening/galaxytools/tree/master/orphan_tool_dependencies
  #                
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://pypi.python.org/packages/source/s/scikit-learn/scikit-learn-0.14.1.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagenumpy17"
  depends_on "jmchilton/toolshed/iuc_packagescipy012"
  depends_on "jmchilton/toolshed/iuc_packagematplotlib12"
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