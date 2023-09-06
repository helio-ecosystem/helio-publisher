# Helio Publisher




## Quickstart

There are two methods to deploy the Helio Publisher. Simplest method is to run the following Docker recipe. 

````yml
version: '3'
services:
  helio-publisher:
    image: acimmino/kgbuilder:4.0.0
    volumes: 
      - ./views/:/usr/src/kgb/views/
      - ./db/:/usr/src/kgb/db/
    ports:
      - "4567:4567"
      - "9000:9000"
````
As a result two folders are created
 * The folder `views` contains the HTML templates used by the service. Initially is empty, a [default view could be downloaded]() and pasted in this folder for a quickstart.
 * The folder `db`  contains the storage of this service, it is recommended to make periodical copies of the content as backups.







