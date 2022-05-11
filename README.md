
# Encoding rights management data: A preliminary test

This if for finding a way to encode rights management data in a
bibliographic record, enabling scripts to automatic checks for
accessibility.

The metadata I play with is for [a portrait made by Clara Petersen](./clara-petersen.xml)

![Descision tree](decision-tree.svg)

# Restriction and Use

I have three steps in the decision if a resource should be published
with or without special conditions.

The Blocking is related to  type="restriction on access"

```
<accessCondition type="restriction on access" displayLabel="Access Status">Blokeret</accessCondition>
```

Special conditions should be encoded as  type="use and reproduction"

```
<accessCondition type="use and reproduction">In Copyright</accessCondition>
```

# Copyright

I have modified the CopyrightMD rights management schema such that
corporate bodies can be rights holders and their rights might expire
exactly like for individuals 70 years after the entity was closed.

See University of California's [solution](https://cdlib.org/groups/rights-management-group-copyrightmd/)

* Proposed schema [copyright-md.rng](copyright-md.rng)
  * Derived schemas [copyright-md.rnc](copyright-md.rnc) and
  * [copyright-md.xsd](copyright-md.xsd). Note [dk.xsd](dk.xsd) (W3 XML Schema wants one module per name space).

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
      <year.started>1910</year.started>
      <year.ended>1920</year.ended>
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
