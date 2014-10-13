require 'formula'

class MattshirleyNcbisratoolkit < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/matt-shirley/ncbi_sra_toolkit
  # Tool Shed Readme:
  #    Tools from NCBI SRA Toolkit for extracting FASTQ and SAM format reads from SRA format archives.
  #    This software release was designed to run under Linux, MacOSX operating systems on Intel x86-compatible 64 bit architectures.
  #    When running on Amazon EC2, be sure to keep in mind the size limitation of EBS storage devices when requesting a
  #    download of a large SRA data set.
  #    
  #    Build Requirements:
  #      ar
  #      bash
  #      make
  #      gcc, g++
  #      libxml2
  #      libcurl4
  #      zlib
  #    
  #    On a debian based Linux OS use:
  #    
  #      apt-get install build-essential libxml2-dev libcurl4-openssl-dev zlib-dev
  #        
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.3.4-2/sra_sdk-2.3.4-2.tar.gz"
  sha1 ""
  
  def install
    system "make release" 
    system "make static" 
    system "make" 
    system "mkdir", "-p", "#{prefix}/bin"
    system "mkdir", "-p", "#{prefix}/ncbi"
    system "mkdir", "-p", "#{prefix}/ncbi/public"
    system "sed -i -e \"s|\$(HOME)|#{prefix}|g\" -e \"s|cache-enabled = \\"true\\"|cache-enabled = \\"false\\"|\" bin64/ncbi/default.kfg" 
    system "cp --recursive --dereference bin64/* #{prefix}/bin" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end