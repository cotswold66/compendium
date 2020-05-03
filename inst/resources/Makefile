vpath %.Rmd ./analysis
vpath %.R ./data-raw
vpath %.rda ./data
vpath %.rds ./data-raw
vpath %.csv ./data-raw
vpath %.pdf ./output
vpath %.html ./output
vpath %.xlsx ./data-raw


ANALYSIS_SOURCE = $(wildcard ./analysis/*.Rmd)
ANALYSIS_OUT = $(notdir $(ANALYSIS_SOURCE:%.Rmd=%.pdf))

.PHONY: convert clean distclean

all : $(ANALYSIS_OUT)

%.html : %.Rmd
	Rscript -e 'rmarkdown::render("$<",\
	output_format = "bookdown::html_document2",\
	output_dir = "./output"\
	)'

%.pdf : %.Rmd
	Rscript -e 'rmarkdown::render("$<",\
	output_format = "bookdown::pdf_document2",\
	output_dir = "./output"\
	)'

%.rda : %.R
	Rscript $<


# example.html : example.rda

# example.pdf : example.rda

# example.rda : example.rds


convert :
	Rscript ./data-raw/convert.R

clean :
	rm -f ./output/*.html ./output/*.pdf

distclean : clean
	rm -f ./data/*.rda
