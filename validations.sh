#!/bin/sh



xmllint --relaxng copyright-md.rng clara-petersen-copyright.xml
xmllint --schema dk.xsd clara-petersen-copyright.xml
