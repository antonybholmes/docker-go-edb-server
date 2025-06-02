git pull

mkdir -p src

cd src

git clone git@github.com:antonybholmes/go-edb-server.git
git clone git@github.com:antonybholmes/go-edb-server-gin.git
git clone git@github.com:antonybholmes/go-edb-server-mailer.git
git clone git@github.com:antonybholmes/go-dna.git
git clone git@github.com:antonybholmes/go-genome.git
git clone git@github.com:antonybholmes/go-web.git
git clone git@github.com:antonybholmes/go-basemath.git
git clone git@github.com:antonybholmes/go-sys.git
git clone git@github.com:antonybholmes/go-mailer.git
git clone git@github.com:antonybholmes/go-mutations.git
git clone git@github.com:antonybholmes/go-geneconv.git
git clone git@github.com:antonybholmes/go-pathway.git
git clone git@github.com:antonybholmes/go-motifs.git
git clone git@github.com:antonybholmes/go-gex.git
git clone git@github.com:antonybholmes/go-seqs.git
git clone git@github.com:antonybholmes/go-beds.git
git clone git@github.com:antonybholmes/go-cytobands.git
git clone git@github.com:antonybholmes/go-hubs.git
git clone git@github.com:antonybholmes/go-scrna.git

pwd=`pwd`
for d in `find ${pwd} -maxdepth 1 -mindepth 1 -type d`
do
	echo ${d}
	cd ${d}
	./pull.sh ${msg}
	cd ${pwd}
done
