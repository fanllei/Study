#!/online/software/R-3.3.2/bin/Rscript --slave
chmod u+x runtest.sh

vcf<-read.table(file="/offline/bcl_test/bioinfo-training/04vcf/CHG029162.ready.snp.vcf",head=F,as.is=T)
vcf$DP<-unlist(lapply(vcf[,10],function(x){unlist(strsplit(x,":"))[3]}))
vcf <- vcf[vcf[,7]== "PASS" & as.numeric(gsub(",","",vcf[,11],fixed=TRUE))>100 & vcf[,1]== "chrY",]
write.table(vcf,file="/offline/bcl_test/bioinfo-training/test/filter.vcf",row.names=T,col.name=F,quote=F, sep="\t")
