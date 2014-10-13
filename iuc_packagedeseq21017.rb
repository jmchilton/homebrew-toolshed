require 'formula'
require 'json'

class IucPackagedeseq21017 < Formula
  version "1.0"
  # Recipe auto-generate from repository https://toolshed.g2.bx.psu.edu/iuc/package_deseq2_1_0_17
  # Tool Shed Readme:
  #    
  #            Differential gene expression analysis based on the negative binomial distribution.
  #            http://www.bioconductor.org/packages/2.12/bioc/html/DESeq2.html
  #            Ubuntu has a bug with libgfortran. To fix that create a symlink like: sudo ln -s /usr/lib/x86_64-linux-gnu/libgfortran.so.3 /usr/lib/x86_64-linux-gnu/libgfortran.so
  #            
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
  
  url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/BiocGenerics_0.6.0.tar.gz", :using => :nounzip
  sha1 ""
  resource 'IRanges_1.18.2' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/IRanges_1.18.2.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'GenomicRanges_1.12.4' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/GenomicRanges_1.12.4.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'Rcpp_0.10.4' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/Rcpp_0.10.4.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'RcppArmadillo_0.3.900.0' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/RcppArmadillo_0.3.900.0.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'locfit_1.5-9.1' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/locfit_1.5-9.1.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'Biobase_2.20.1' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/Biobase_2.20.1.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'DBI_0.2-7' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/DBI_0.2-7.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'RSQLite_0.11.4' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/RSQLite_0.11.4.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'AnnotationDbi_1.22.6' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/AnnotationDbi_1.22.6.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'xtable_1.7-1' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/xtable_1.7-1.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'XML_3.98-1.1' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/XML_3.98-1.1.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'annotate_1.38.0' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/annotate_1.38.0.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'genefilter_1.42.0' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/genefilter_1.42.0.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'RColorBrewer_1.0-5' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/RColorBrewer_1.0-5.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'DESeq2_1.0.18' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/DESeq2_1.0.18.tar.gz", :using => :nounzip
    sha1 ""
  end
  resource 'rjson_0.2.13' do
    url "https://github.com/bgruening/download_store/raw/master/DESeq2-1_0_18/rjson_0.2.13.tar.gz", :using => :nounzip
    sha1 ""
  end
  
  depends_on "jmchilton/toolshed/iuc_packager301"
  def install
    # Skipping set_environment_for_install command, handled by platform brew.
    resource('BiocGenerics_0.6.0').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('IRanges_1.18.2').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('GenomicRanges_1.12.4').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('Rcpp_0.10.4').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('RcppArmadillo_0.3.900.0').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('locfit_1.5-9.1').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('Biobase_2.20.1').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('DBI_0.2-7').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('RSQLite_0.11.4').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('AnnotationDbi_1.22.6').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('xtable_1.7-1').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('XML_3.98-1.1').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('annotate_1.38.0').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('genefilter_1.42.0').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('RColorBrewer_1.0-5').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('DESeq2_1.0.18').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    resource('rjson_0.2.13').stage do
        # Tool Shed would download inside build directory instead of its own - so move download.
        buildpath.install Dir["*"]
    end
    system "mkdir", "-p", "#{prefix}/deseq2/"
    system <<-EOF
export PATH=$PATH:$R_HOME/bin &&
export R_LIBS=#{prefix}/deseq2/ &&
Rscript -e "install.packages(c('BiocGenerics_0.6.0.tar.gz','IRanges_1.18.2.tar.gz','GenomicRanges_1.12.4.tar.gz','Rcpp_0.10.4.tar.gz','RcppArmadillo_0.3.900.0.tar.gz','locfit_1.5-9.1.tar.gz','Biobase_2.20.1.tar.gz','DBI_0.2-7.tar.gz','RSQLite_0.11.4.tar.gz','AnnotationDbi_1.22.6.tar.gz','xtable_1.7-1.tar.gz','XML_3.98-1.1.tar.gz','annotate_1.38.0.tar.gz','genefilter_1.42.0.tar.gz','RColorBrewer_1.0-5.tar.gz','DESeq2_1.0.18.tar.gz', 'rjson_0.2.13.tar.gz'),lib='#{prefix}/deseq2/', repos=NULL, dependencies=FALSE)"
EOF
    environment([{'action'=> 'append', 'variable'=> 'R_LIBS', 'value'=> '$KEG_ROOT/deseq2/'}])
  end
  
  def environment(actions)
      # Setup envirnoment variable modifications that will be used later by
      # platform-brew's env and vinstall commands.
      act_hash = {"actions" => actions}
      (prefix / "platform_environment.json").write act_hash.to_json
  end
  
end