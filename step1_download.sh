git clone git@github.com:antonybholmes/go-edb-api.git
git clone git@github.com:antonybholmes/go-dna.git
git clone git@github.com:antonybholmes/go-genes.git
git clone git@github.com:antonybholmes/go-auth.git
git clone git@github.com:antonybholmes/go-basemath.git
git clone git@github.com:antonybholmes/go-sys.git
git clone git@github.com:antonybholmes/go-mailer.git
git clone git@github.com:antonybholmes/go-mutations.git
git clone git@github.com:antonybholmes/go-geneconv.git
git clone git@github.com:antonybholmes/go-pathway.git
git clone git@github.com:antonybholmes/go-microarray.git
git clone git@github.com:antonybholmes/go-motiftogene.git
git clone git@github.com:antonybholmes/go-gex.git

pwd=`pwd`
for d in `find . -maxdepth 1 -type d`
do
	cd ${d}
	git pull
	cd ${pwd}
done

#mkdir logs
#mkdir data
