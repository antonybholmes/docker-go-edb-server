git pull

mkdir -p src

cd src

git clone https://github.com/antonybholmes//go-edb-server.git
git clone https://github.com/antonybholmes//go-edb-server-mailer.git
git clone https://github.com/antonybholmes//go-dna.git
git clone https://github.com/antonybholmes//go-genes.git
git clone https://github.com/antonybholmes//go-auth.git
git clone https://github.com/antonybholmes//go-basemath.git
git clone https://github.com/antonybholmes//go-sys.git
git clone https://github.com/antonybholmes//go-mailer.git
git clone https://github.com/antonybholmes//go-mutations.git
git clone https://github.com/antonybholmes//go-geneconv.git
git clone https://github.com/antonybholmes//go-pathway.git
git clone https://github.com/antonybholmes//go-motiftogene.git
git clone https://github.com/antonybholmes//go-gex.git

pwd=`pwd`
for d in `find ${pwd} -maxdepth 1 -mindepth 1 -type d`
do
	echo ${d}
	cd ${d}
	./pull.sh ${msg}
	cd ${pwd}
done
