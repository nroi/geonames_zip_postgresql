# geonames\_zip\_postgresql

Copies the zip codes / postal codes from geonames into a PostgreSQL database. Apart from a PostgreSQL database, only `unzip`, `wget` and `sed` are required.

Includes a bash script and an SQL script to import the zip codes from http://download.geonames.org/export/zip/ into a PostgreSQL database. Two things to watch out for:
1. If you happen to already have a schema called 'geonames' in your database, this script will drop it.
2. At the time of writing (2018-05-31), the file from geonames.org includes names with a trailing backslash. It seems that this backslash is *not* indented as an escape character, although I do find place names with backslashes rather surprising. However, the official website also lists places whose names contain backslashes (see http://www.geonames.org/postalcode-search.html?q=Chunni%5C&country=IN). This is why `sed` is used to replace all backslashes by double-backslashes, hence backslashes will be inserted as backslashes and not interpreted as escape characters.
