push:
	rsync --update --progress -a docs/* zadigh@www.lamadon.com:/home/zadigh/econ21100.lamadon.com

compile:
	R -e 