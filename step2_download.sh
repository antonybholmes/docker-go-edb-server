# download some utils the app needs to render bigWig files
# we must download the aarch64 versions of the utils which work
# inside the docker debian image. They do not seem to work in the
# Amazon Linux environment.

mkdir -p bin	
wget https://hgdownload.soe.ucsc.edu/admin/exe/linux.aarch64/bigWigSummary -O bin/bigWigSummary
chmod +x bin/bigWigSummary
wget https://hgdownload.soe.ucsc.edu/admin/exe/linux.aarch64/bedGraphToBigWig -O bin/bedGraphToBigWig
chmod +x bin/bedGraphToBigWig