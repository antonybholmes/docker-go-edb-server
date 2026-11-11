# download some utils the app needs to render bigWig files

mkdir -p bin	
wget https://hgdownload.soe.ucsc.edu/admin/exe/linux.aarch64/bigWigSummary -O bin/bigWigSummary
chmod +x bin/bigWigSummary
wget https://hgdownload.soe.ucsc.edu/admin/exe/linux.aarch64/bedGraphToBigWig -O bin/bedGraphToBigWig
chmod +x bin/bedGraphToBigWig