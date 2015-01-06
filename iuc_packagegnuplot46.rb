require 'formula'
require 'json'

class IucPackagegnuplot46 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_gnuplot_4_6
  # Tool Shed Readme:
  #    
  #            Gnuplot is a portable command-line driven graphing utility for Linux, OS/2, MS Windows, OSX, VMS, and many other platforms.
  #            It was originally created to allow scientists and students to visualize mathematical functions and data interactively, 
  #            but has grown to support many non-interactive uses such as web scripting. It is also used as a plotting engine by third-party applications like Octave. 
  #    
  #            http://www.gnuplot.info/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://downloads.sourceforge.net/project/gnuplot/gnuplot/4.6.6/gnuplot-4.6.6.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagelibgd21"
  depends_on "jmchilton/toolshed/devteam_packagecairo11214"
  depends_on "jmchilton/toolshed/iuc_packagereadline62"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    onoe("Unhandled tool shed action [autoconf] encountered.")
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'set', 'variable'=> 'GNUPLOT_ROOT_PATH', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$ENV[LIBGD_ROOT_PATH]/lib'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end