require 'formula'
require 'json'

class DevteamPackagegatk14 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/devteam/package_gatk_1_4
  # Tool Shed Readme:
  #    
  #    Copyright (c) 2011 The Broad Institute
  #    
  #    Permission is hereby granted, free of charge, to any person
  #    obtaining a copy of this software and associated documentation
  #    files (the "Software"), to deal in the Software without
  #    restriction, including without limitation the rights to use,
  #    copy, modify, merge, publish, distribute, sublicense, and/or sell
  #    copies of the Software, and to permit persons to whom the
  #    Software is furnished to do so, subject to the following
  #    conditions:
  #    
  #    The above copyright notice and this permission notice shall be
  #    included in all copies or substantial portions of the Software.
  #    
  #    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  #    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
  #    OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  #    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
  #    HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
  #    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  #    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
  #    THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://depot.galaxyproject.org/package/noarch/gatk-1.4.tar.gz"
  sha1 ""
  
  def install
    system "mkdir", "-p", "#{prefix}/jars"
    mv Dir["./*"], "#{prefix}/jars" 
    environment([{'action'=> 'set', 'variable'=> 'JAVA_JAR_PATH', 'value'=> '$KEG_ROOT/jars'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end