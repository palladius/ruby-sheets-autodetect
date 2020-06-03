# Synopsis

This library tries to auto-detect Spreadsheet cells (using manual rudimentary inference! Hence totally error prone!) and autodetect 


## TLDR

Given a spreadsheet with a tab "Cars" and these values:

    Name	Description	isSportsCar	Brand	Modello	DoB	Num Wheels
    Bolide	il mio gran ferro	TRUE	Ferrari	Testarossa	Fri, 5 May 	4
    Fiona	la mia macchina bellissima	FALSE	Mercedes	C180 Avantgarde	Thu, 1 May 	4

It will generate this string (note: still work in progress to detect Text vs String):

    rails generate scaffold Car name:Text description:Text issportscar:Boolean brand:Text modello:Text dob:Text num_wheels:Integer discordanti:Text colore:Text

## Notes

Library I'm using to get Spreado values into ruby:

Docs: 
https://www.rubydoc.info/github/gimite/google-drive-ruby/GoogleDrive/Spreadsheet#add_worksheet-instance_method (awesome!)

# problems

Detect type from string seems the hardest part.

* Guy did it in Java: https://stackoverflow.com/questions/13314215/java-how-to-infer-type-from-data-coming-from-multiple-sources

# (Supported) Rails types

These are rails types (different from Ruby types, at times, eg with Booleans):

    (*) integer
    primary_key
    (*) decimal # (for currency)
    (*) float
    (*) boolean # for TrueClass and FalseClass
    binary
    (*) string
    (*) text    # Still need to change class to be able to distinguish between String and Text
    (*) date
    (*) time
    (*) datetime

for text, we can use the STRLEN (like: >15 is TEXT below 15 is string. Just an idea.)

## Thanks

* `gimite` for the `Sheets` gem.