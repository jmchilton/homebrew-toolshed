require 'formula'
require 'json'

class IucPackagelibcurl735 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_libcurl_7_35
  # Tool Shed Readme:
  #    
  #                libcurl is a free and easy-to-use client-side URL transfer library, supporting DICT, FILE, FTP, FTPS, Gopher, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMTP, SMTPS, Telnet and TFTP. libcurl supports SSL certificates, HTTP POST, HTTP PUT, FTP uploading, HTTP form based upload, proxies, cookies, user+password authentication (Basic, Digest, NTLM, Negotiate, Kerberos), file transfer resume, http proxy tunneling and more! 
  #                http://curl.haxx.se/libcurl/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://curl.haxx.se/download/curl-7.35.0.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packageopenssl10"
  depends_on "jmchilton/toolshed/iuc_packagezlib128"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    onoe("Unhandled tool shed action [autoconf] encountered.")
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'set', 'variable'=> 'LIBCURL_ROOT_DIR', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end