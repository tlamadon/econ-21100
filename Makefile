push:
	rsync -e ssh --checksum --update --progress -a docs/* zadigh@lamadon.com:/home/zadigh/econ21130.lamadon.com
	rsync -e ssh --checksum --update --progress -a pdf/* zadigh@lamadon.com:/home/zadigh/econ21130.lamadon.com/pdf

PAGES = \
	docs/bootstrap.html \
	docs/gfe.html \
	docs/hazard.html \
	docs/hw-dynchoice.html \
	docs/hw-em.html \
	docs/hw-hetero.html \
	docs/hw-inference.html \
	docs/hw-insurance.html \
	docs/hw-lsupply.html \
	docs/hw-probability.html \
	docs/index.html \
	docs/lab-discretechoice.html \
	docs/lab-dynchoice.html \
	docs/lab-labor-supply.html \
	docs/lab-ridge-isl.html \
	docs/linear-selection.html \
	docs/np-regression.html \
	docs/panel-linear.html \
	docs/sched.html \
	docs/TA-Gittutorial.html \
	docs/TA-Rmarkdown.html \
	docs/TA-Rregression.html \
	docs/TA-Rtutorial.html 

docs/%.html: src/%.Rmd src/_site.yml
	R -e "rmarkdown::render_site('./$<')"

all: $(PAGES)
