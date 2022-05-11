
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


