require 'formula'
require 'json'

class IucPackageopenssl10 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_openssl_1_0
  # Tool Shed Readme:
  #    
  #                The OpenSSL Project is a collaborative effort to develop a robust, commercial-grade, full-featured, and Open Source toolkit implementing the Secure Sockets Layer (SSL v2/v3) and Transport Layer Security (TLS v1) protocols as well as a full-strength general purpose cryptography library. 
  #                The project is managed by a worldwide community of volunteers that use the Internet to communicate, plan, and develop the OpenSSL toolkit and its related documentation. 
  #    
  #                https://www.openssl.org/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://ftp.openssl.org/source/openssl-1.0.1g.tar.gz"
  sha1 ""
  
  depends_on "jmchilton/toolshed/iuc_packagezlib128"
  depends_on "jmchilton/toolshed/iuc_packageperl518"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    system "./config --prefix=#{prefix} shared" 
    system "rm ./doc/apps/cms.pod" 
    system "rm ./doc/apps/smime.pod" 
    system "rm ./doc/crypto/X509_STORE_CTX_get_error.pod" 
    system "rm ./doc/ssl/SSL_accept.pod" 
    system "rm ./doc/ssl/SSL_clear.pod" 
    system "rm ./doc/ssl/SSL_COMP_add_compression_method.pod" 
    system "rm ./doc/ssl/SSL_connect.pod" 
    system "rm ./doc/ssl/SSL_CTX_add_session.pod" 
    system "rm ./doc/ssl/SSL_CTX_load_verify_locations.pod" 
    system "rm ./doc/ssl/SSL_CTX_set_client_CA_list.pod" 
    system "rm ./doc/ssl/SSL_CTX_set_session_id_context.pod" 
    system "rm ./doc/ssl/SSL_CTX_set_ssl_version.pod" 
    system "rm ./doc/ssl/SSL_CTX_use_psk_identity_hint.pod" 
    system "rm ./doc/ssl/SSL_do_handshake.pod" 
    system "rm ./doc/ssl/SSL_read.pod" 
    system "rm ./doc/ssl/SSL_session_reused.pod" 
    system "rm ./doc/ssl/SSL_set_fd.pod" 
    system "rm ./doc/ssl/SSL_set_session.pod" 
    system "rm ./doc/ssl/SSL_shutdown.pod" 
    system "rm ./doc/ssl/SSL_write.pod" 
    system "make install"
    # Tool Shed set environment variable that is picked implicitly.
    environment([{'action'=> 'prepend', 'variable'=> 'LD_LIBRARY_PATH', 'value'=> '$KEG_ROOT/lib'},{'action'=> 'set', 'variable'=> 'OPENSSL_ROOT_DIR', 'value'=> '$KEG_ROOT'},{'action'=> 'prepend', 'variable'=> 'C_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'prepend', 'variable'=> 'CPLUS_INCLUDE_PATH', 'value'=> '$KEG_ROOT/include'},{'action'=> 'prepend', 'variable'=> 'PKG_CONFIG_PATH', 'value'=> '$KEG_ROOT/lib/pkgconfig'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end