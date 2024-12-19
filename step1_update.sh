git pull

mkdir -p src

cd src

git clone git@github.com:antonybholmes/go-edb-server.git
git clone git@github.com:antonybholmes/go-edb-server-mailer.git
git clone git@github.com:antonybholmes/go-dna.git
git clone git@github.com:antonybholmes/go-genes.git
git clone git@github.com:antonybholmes/go-auth.git
git clone git@github.com:antonybholmes/go-basemath.git
git clone git@github.com:antonybholmes/go-sys.git
git clone git@github.com:antonybholmes/go-mailer.git
git clone git@github.com:antonybholmes/go-mutations.git
git clone git@github.com:antonybholmes/go-geneconv.git
git clone git@github.com:antonybholmes/go-pathway.git
git clone git@github.com:antonybholmes/go-motifs.git
git clone git@github.com:antonybholmes/go-gex.git
git clone git@github.com:antonybholmes/go-tracks.git

pwd=`pwd`
for d in `find ${pwd} -maxdepth 1 -mindepth 1 -type d`
do
	echo ${d}
	cd ${d}
	./pull.sh ${msg}
	cd ${pwd}
done
