require 'formula'

class IucPackagehmmer30 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_hmmer_3_0
  # Tool Shed Readme:
  #    
  #    HMMER is used to search sequence databases for homologs of protein sequences, and to make protein
  #    sequence alignments. HMMER can be used to search sequence databases with single query sequences
  #    but it becomes particularly powerful when the query is an multiple sequence alignment of a sequence family.
  #    HMMER makes a profile of the query that assigns a position-specific scoring system for substitutions,
  #    insertions, and deletions. HMMER profiles are probabilistic models called "profile hidden Markov models"
  #    (profile HMMs) (Krogh et al., 1994; Eddy, 1998; Durbin et al., 1998).
  #    
  #    Compared to BLAST, FASTA, and other sequence alignment and database search tools based on older
  #    scoring methodology, HMMER aims to be significantly more accurate and more able to detect remote
  #    homologs, because of the strength of its underlying probability models. In the past, this strength came
  #    at a significant computational cost, with profile HMM implementations running about 100x slower than
  #    comparable BLAST searches. With HMMER3, HMMER is now essentially as fast as BLAST.
  #    
  #    The programs in HMMER::
  #    
  #      Single sequence queries: new to HMMER3::
  #    
  #        phmmer Search a sequence against a sequence database. (BLASTP-like)
  #        jackhmmer Iteratively search a sequence against a sequence database. (PSIBLAST-like)
  #    
  #      Replacements for HMMER2's functionality::
  #    
  #        hmmbuild Build a pro#le HMM from an input multiple alignment.
  #        hmmsearch Search a pro#le HMM against a sequence database.
  #        hmmscan Search a sequence against a pro#le HMM database.
  #        hmmalign Make a multiple alignment of many sequences to a common pro#le HMM.
  #    
  #      Other utilities::
  #    
  #        hmmconvert Convert pro#le formats to/from HMMER3 format.
  #        hmmemit Generate (sample) sequences from a pro#le HMM.
  #        hmmfetch Get a pro#le HMM by name or accession from an HMM database.
  #        hmmpress Format an HMM database into a binary format for hmmscan.
  #        hmmstat Show summary statistics for each pro#le in an HMM database
  #    
  #    ftp://selab.janelia.org/pub/software/hmmer3/3.0/Userguide.pdf
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "ftp://selab.janelia.org/pub/software/hmmer3/3.0/hmmer-3.0.tar.gz"
  sha1 ""
  
  def install
    system "./configure --prefix #{prefix}" 
    system "make" 
    system "make install" 
    # Tool Shed set environment variable that is picked implicitly.
  end
end