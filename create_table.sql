drop schema if exists geonames cascade;

create schema geonames;

create table geonames.zipcodes (
    country_code text check (char_length(country_code) = 2) not null,
    postal_code text check (char_length(postal_code) <= 20) not null,
    place_name text check (char_length(place_name) <= 180),
    admin_name1 text check (char_length(admin_name1) <= 100),
    admin_code1 text check (char_length(admin_code1) <= 20),
    admin_name2 text check (char_length(admin_name2) <= 100),
    admin_code2 text check (char_length(admin_code2) <= 20),
    admin_name3 text check (char_length(admin_name3) <= 100),
    admin_code3 text check (char_length(admin_code3) <= 20),
    longitude numeric(7,4) not null,
    latitude numeric(7,4) not null,
    accuracy integer
);

comment on column geonames.zipcodes.country_code is 'iso country code, 2 characters';
comment on column geonames.zipcodes.admin_name1 is '1. order subdivision (state)';
comment on column geonames.zipcodes.admin_code1 is '1. order subdivision (state))';
comment on column geonames.zipcodes.admin_name2 is '2. order subdivision (county/province)';
comment on column geonames.zipcodes.admin_code2 is '2. order subdivision (county/province)';
comment on column geonames.zipcodes.admin_name3 is '3. order subdivision (community)';
comment on column geonames.zipcodes.admin_code3 is '3. order subdivision (community)';
comment on column geonames.zipcodes.latitude is 'estimated latitude';
comment on column geonames.zipcodes.longitude is 'estimated longitude';
comment on column geonames.zipcodes.accuracy is 'accuracy of lat/lng from 1=estimated to 6=centroid';

create index on geonames.zipcodes (country_code, postal_code);
create index on geonames.zipcodes (country_code, place_name);
create index on geonames.zipcodes (postal_code);
create index on geonames.zipcodes (place_name);
create index on geonames.zipcodes (admin_name1);
create index on geonames.zipcodes (admin_code1);
create index on geonames.zipcodes (admin_name2);
create index on geonames.zipcodes (admin_code2);
create index on geonames.zipcodes (admin_name3);
create index on geonames.zipcodes (admin_code3);
