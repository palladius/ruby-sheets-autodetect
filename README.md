# Synopsis

This library tries to auto-detect Spreadsheet cells (using manual rudimentary inference! Hence totally error prone!) and autodetect 


## TL;DR

Given a spreadsheet with a tab "Cars" and these values:

    Name	Description	isSportsCar	Brand	Modello	DoB	Num Wheels
    Bolide	il mio gran ferro	TRUE	Ferrari	Testarossa	Fri, 5 May 	4
    Fiona	la mia macchina bellissima	FALSE	Mercedes	C180 Avantgarde	Thu, 1 May 	4

![Input Data](https://raw.githubusercontent.com/palladius/ruby-sheets-autodetect/master/images/Source%20Data%20(one%20tab).png)

It will generate this string (note: still work in progress to detect Text vs String):

    rails generate scaffold Car name:Text description:Text issportscar:Boolean brand:Text modello:Text dob:Text num_wheels:Integer discordanti:Text colore:Text

![Ouput Data](https://raw.githubusercontent.com/palladius/ruby-sheets-autodetect/master/images/Output%20data%20(one%20line%20per%20tab).png)


## Install

All you need to do is two things:

* `$ bundle install` for gems. Easy peasy.

* Create a Service Account and name it like the json.dist (without .dist). Should look similar to the dist with some random strings. That SvcAcct needs to be able to read your spreadsheet.  Some docs for task 2: https://github.com/juampynr/google-spreadsheet-reader and https://stackoverflow.com/questions/27764544/rails-export-data-in-google-spreadsheet and https://stackoverflow.com/questions/50376820/how-do-i-authorize-a-service-account-for-google-calendar-api-in-ruby

## Notes

* Library I'm using to get Spreado values into ruby: https://www.rubydoc.info/github/gimite/google-drive-ruby/GoogleDrive/Spreadsheet#add_worksheet-instance_method (awesome!)
* I've used `money` gem to import Currency as money class (internet says I should use BigDecmal so I do). My dream is to be able to have a class for it, or TWO columns ("2 EUR" MySalary would become MySalaryyValue:BigDecimal MySalaryCurrency:String for "2" and "EUR" resp).

# problems

Detect type from string seems the hardest part. Internet seems to suggest that any try to do it is futile and lame. Look at my implementation and you'll definitely agree :) Of course if I detect "2" as integer there's no way in the world you can have "2" as string. Unless the "MyColumn" has "2", "ciao", "mamma" -> then majority will be strings.

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

## TODOs

* P1 infer String vs Text
* P2 import data into Fixtures, with right types.
* P3 create a script that launches rails generate and rake db:migrate, maybe allowing you to customize, like create proper singularization for your tabs or allowing you to adjust values.

## Credits

*  Hiroshi Ichikawa (`gimite`) for the `Sheets`/`GoogleDrive` gem. More credits: https://www.rubydoc.info/github/gimite/google-drive-ruby/GoogleDrive