require 'formula'

class JjohnsonPackagersem1117 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/jjohnson/package_rsem_1_1_17
  # Tool Shed Readme:
  #    
  #    RSEM is a software package for estimating gene and isoform expression levels from RNA-Seq data. The RSEM package provides an user-friendly 
  #    interface, supports threads for parallel computation of the EM algorithm, single-end and paired-end read data, quality scores, 
  #    variable-length reads and RSPD estimation. In addition, it provides posterior mean and 95X credibility interval estimates for expression levels. 
  #    For visualization,It can generate BAM and Wiggle files in both transcript-coordinate and genomic-coordinate. Genomic-coordinate files 
  #    can be visualized by both  UCSC Genome browser and Broad InstituteXs Integrative Genomics Viewer (IGV). 
  #    Transcript-coordinate files can be visualized by IGV. 
  #    
  #    http://deweylab.biostat.wisc.edu/rsem/README.html
  #    http://deweylab.biostat.wisc.edu/rsem/
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "http://deweylab.biostat.wisc.edu/rsem/src/rsem-1.1.17.tar.gz"
  sha1 ""
  
  def install
    system "make" 
    system "mkdir", "-p", "#{prefix}/bin/sam"
    system "mkdir", "-p", "#{prefix}/bin/sam"
    mv "sam/samtools", "#{prefix}/bin/sam"
    bin.install "convert-sam-for-rsem"
    bin.install "extract-transcript-to-gene-map-from-trinity"
    bin.install "rsem-bam2readdepth"
    bin.install "rsem-bam2wig"
    bin.install "rsem-build-read-index"
    bin.install "rsem-calculate-credibility-intervals"
    bin.install "rsem-calculate-expression"
    bin.install "rsem-extract-reference-transcripts"
    bin.install "rsem-gen-transcript-plots"
    bin.install "rsem-get-unique"
    bin.install "rsem-parse-alignments"
    bin.install "rsem-plot-model"
    bin.install "rsem-plot-transcript-wiggles"
    bin.install "rsem-prepare-reference"
    bin.install "rsem-preref"
    bin.install "rsem-run-em"
    bin.install "rsem-run-gibbs"
    bin.install "rsem-simulate-reads"
    bin.install "rsem-synthesis-reference-transcripts"
    bin.install "rsem-tbam2gbam"
    # Tool Shed set environment variable that is picked implicitly.
  end
end