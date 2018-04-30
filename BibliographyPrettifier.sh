#!/bin/bash
# 

### This shell script performs some regexp perl manipulations 
### on the .bbl file produced by the arthur.bst bibstyle file. 
### Its main function is to fix the DOI links so that the 
### linked text won't include the period preceding the citation, 
### which is minor but annoying once you notice it.

inputfile="AuNaturel.bbl"
#texfile="TheYoungManTheStation.tex"

#for testing
#cp build/TheYoungManTheStation.bbl test.bbl
#inputfile="test.bbl"

# Move periods next to DOIs
perl -pi -0 -w -e 's@\\href\{http://dx.doi.org/(.*)}\{.\n\\newblock@. \\newblock \\href{http://dx.doi.org/$1}{@g' $inputfile
# Note that this will mangle any article title that ends in ! or ?


# Hackish fix for titles ending in ? if needed
#perl -pi -0 -w -e 's@?.@?@g' $inputfile

# Run pdflatex to implement changes, if wanted
#pdflatex $texfile

