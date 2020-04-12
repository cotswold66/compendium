vpath %.Rmd ./analysis
vpath %.R ./data-raw
vpath %.rda ./data
vpath %.rds ./data-raw
vpath %.html ./output


ANALYSIS_SOURCE = $(wildcard ./analysis/*.Rmd)
ANALYSIS_OUT = $(notdir $(ANALYSIS_SOURCE:%.Rmd=%.html))

.PHONY: data analysis convert distclean

all : $(ANALYSIS_OUT)

%.html : %.Rmd
	Rscript -e 'rmarkdown::render("$<",\
	output_format = "bookdown::html_document2",\
	output_dir = "./output"\
	)'

# example.html : example.rda

data %.rda : %.R
	Rscript $<

# example.rda : example.rds


convert :
	Rscript ./data-raw/convert.R

clean :
	rm -f ./output/*.html

distclean : clean
	rm -f ./data/*.rda
