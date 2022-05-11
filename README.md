
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
