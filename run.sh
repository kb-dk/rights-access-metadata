#!/bin/bash

java -jar ~/saxon/saxon9he.jar clara-petersen.xml is-there-copyright.xsl this_year=2022
java -jar ~/saxon/saxon9he.jar clara-petersen.xml is-there-copyright.xsl this_year=2030
java -jar ~/saxon/saxon9he.jar clara-petersen.xml is-there-copyright.xsl this_year=2050

