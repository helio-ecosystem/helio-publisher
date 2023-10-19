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



### Acknowledgements
This project has been partially funded by:

 | Project       | Grant |
 |   :---:      |      :---      |
 | <img src="https://github.com/helio-ecosystem/helio-ecosystem/assets/4105186/96d6a9bc-b92d-43fe-a921-c2c4cd811a30" height="80"/>  | The European project [VICINITY](https://vicinity2020.eu/index.html) from the European Union's Horizont 2020 research and innovation programme under grant agreement Nº688467. |
 | <img src="https://github.com/helio-ecosystem/helio-ecosystem/assets/4105186/fa127b1d-3b26-46c6-bae7-b193d6753071" height="80"/>  | The European project [BIMERR](https://bimerr.eu/) from the European Union's Horizont 2020 research and innovation programme under grant agreement Nº820621. |
 | <img src="https://github.com/helio-ecosystem/helio-ecosystem/assets/4105186/4475dd8d-fc4d-416c-84e7-ed16b34c86e7" height="80"/>  | The European project [DELTA](https://www.delta-h2020.eu/) from the European Union's Horizont 2020 research and innovation programme under grant agreement Nº688467. |
 | <img src="https://github.com/helio-ecosystem/helio-ecosystem/assets/4105186/c9081c01-69ed-4ba3-aa1a-fddbaaee19c1" height="80"/>   | The European project [AURORAL](https://www.auroral.eu/) from the European Union's Horizont 2020 research and innovation programme under grant agreement Nº101016854. |
 | <img src="https://github.com/helio-ecosystem/helio-ecosystem/assets/4105186/f1cde449-266f-45f4-a5da-e9c6006f5f3f" height="80"/>  | The European project [COGITO](https://cogito-project.eu/) from the European Union's Horizont 2020 research and innovation programme under grant agreement Nº958310. |





