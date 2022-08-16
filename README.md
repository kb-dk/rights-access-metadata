
# Encoding rights management data: A preliminary test

This is for finding a way to encode rights management data in a
bibliographic record, enabling scripts to do automatic checks for
accessibility.

This note gives examples how to encode the data exported from
Cumulus in a way that enables preservation and discovery systems to
deduce what they can or cannot do when it comes to presentation and
licensing.

The metadata I play with is for [a portrait made by Clara Petersen](./clara-petersen.xml)

![Descision tree](decision-tree.svg)

## Restriction and Use

I have three steps in the decision if a resource should be published
with or without special conditions.

The Blocking is related to  type="restriction on access"

```
<accessCondition type="restriction on access" displayLabel="Access Status">
    Blokeret
</accessCondition>
```

Special conditions should be encoded as  type="use and reproduction"

```
<accessCondition type="use and reproduction">
    In Copyright
</accessCondition>
```

I haven't studied "Restriction" and "Use" vocabularies but I just
cannot even imagine anything requiring extensive markup. I.e., I
foresee a termlist for each these aspects, not much more.

## Copyright

I have modified the CopyrightMD rights management schema such that
corporate bodies can be rights holders and their rights might expire
exactly like for individuals 70 years after the entity was closed.

See University of California's [solution](https://cdlib.org/groups/rights-management-group-copyrightmd/)

* Proposed schema [copyright-md.rng](copyright-md.rng)
  * Derived schemas [copyright-md.rnc](copyright-md.rnc) and
  * [copyright-md.xsd](copyright-md.xsd). Note [dk.xsd](dk.xsd) (W3 XML Schema wants one module per name space).
  

This is adapted [from an
example](https://www.loc.gov/standards/mods/userguide/accesscondition.html#examples)
I found on library of congress
  

```
<?xml version="1.0" encoding="UTF-8" ?>
<copyright xmlns="http://www.cdlib.org/inside/diglib/copyrightMD"
           xmlns:dk="http://id.kb.dk/dk-corporate-creator"
           copyright.status="copyrighted"
           publication.status="unknown">

  <!-- 
       Possible copyright.statuses are:

       copyrighted
       pd public domain, no further info
       pd_expired public domain, because of expired copyright
       pd_holder public domain, Item dedicated to the public domain by the rights holder.
       pd_usfed public domain, US federal documents are not under copyright.
       unknown
  -->
  
  <creation>
    <year.creation year.type="approximate">1920</year.creation>
    <country.creation iso.code="dk">Danmark</country.creation>
  </creation>
  <creator>
    <dk:creator.corporate>
      <name>Ugens nyheder</name>
      <dk:year.started>1910</year.started>
      <dk:year.ended>1920</year.ended>
    </dk:creator.corporate>
  </creator>
  <creator>
    <creator.person>
      <name>Petersen, Clara</name>
      <year.birth>1890</year.birth>
      <year.death>1960</year.death>
    </creator.person>
  </creator>
  <rights.holder>
    <name>Estate of Petersen, Clara</name>
    <contact> user@domain or whatever  </contact>
  </rights.holder>


  <general.note>Transmission or reproduction of materials protected by
  copyright beyond that allowed by fair use requires the written
  permission of the copyright owners.
  bla bla bla bla bla bla bla</general.note>

</copyright>
```

## How to deduce whether an item is free

I have not made a stringent breakdown of the possible combinations of 

* current date
* death of creator (or end of a corporate one)
* publication date

Running the script [`is-there-copyright.xsl`](is-there-copyright.xsl) for different values of
this_year make the kinds of calculations which is needed. This can be
implemented in any language supporting XPath version 2 or better.

```
java -jar ~/saxon/saxon9he.jar clara-petersen.xml is-there-copyright.xsl this_year=2022
java -jar ~/saxon/saxon9he.jar clara-petersen.xml is-there-copyright.xsl this_year=2030
java -jar ~/saxon/saxon9he.jar clara-petersen.xml is-there-copyright.xsl this_year=2050
```

The three years would lead to:

### 2022

The creator, Clara, died at 1960.
This is Anno Domino 2022
Since  this_year - created = 62 is less than 75 it is not OK 

When we don't known the year when the creator died, we could reason as
follows: The portrait was made 1920 this_year - created = 2022 - 1920
= 102, which isn't safe. Clara could have survived long enough for
someone alive to hold the copyright.

### 2030

The creator, Clara, died at 1960.
This is Anno Domino 2030
Since  this_year - created = 70 is less than 75 it is not OK 

When we don't known the year when the creator died, we could reason as
follows: The portrait was made 1920 this_year - created = 2030 - 1920
= 110, which isn't safe. Clara could have survived long enough for
someone alive to hold the copyright

### 2050

The creator, Clara, died at 1960.
This is Anno Domino 2050

Since  90 is more than 75 it is OK 

## Further reading

https://www.getty.edu/publications/intrometadata/rights-metadata/
