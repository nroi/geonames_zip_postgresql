-- See the README.md for an explanation on why sed is used to replace backslashes.
\copy geonames.zipcodes from program '/usr/bin/unzip -p allCountries.zip | sed ''s/\\/\\\\/g''' null as ''
