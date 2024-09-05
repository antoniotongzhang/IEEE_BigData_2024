#!/bin/bash
sudo systemctl start mongod &
sleep 1

mongosh <<EOF
show dbs;
use testd;
db.createCollection("agents");
db.agents.insertMany([{id: 1, first_name: "Fredric", last_name: "MacVean", email: "fmacvean0@amazon.de", gender: "Male"},
 {id: 2, first_name: "Ram", last_name: "Clemmensen", email: "rclemmensen1@dell.com", gender: "Male"},
 {id: 3, first_name: "Hank", last_name: "Anwyl", email: "hanwyl2@privacy.gov.au", gender: "Male"},
 {id: 4, first_name: "Meryl", last_name: "Offner", email: "moffner3@imdb.com", gender: "Male"},
 {id: 5, first_name: "Consolata", last_name: "Fundell", email: "cfundell4@nasa.gov", gender: "Agender"},
 {id: 6, first_name: "Yorker", last_name: "Willmont", email: "ywillmont5@symantec.com", gender: "Male"},
 {id: 7, first_name: "Corbet", last_name: "Alejandre", email: "calejandre6@biglobe.ne.jp", gender: "Male"},
 {id: 8, first_name: "Frederich", last_name: "Bilyard", email: "fbilyard7@apache.org", gender: "Male"},
 {id: 9, first_name: "Donielle", last_name: "Pedlar", email: "dpedlar8@reverbnation.com", gender: "Female"},
 {id: 10, first_name: "Allyn", last_name: "Guinan", email: "aguinan9@photobucket.com", gender: "Male"},
 {id: 11, first_name: "Hunt", last_name: "Vanns", email: "hvannsa@desdev.cn", gender: "Male"},
 {id: 12, first_name: "Flynn", last_name: "Prazor", email: "fprazorb@examiner.com", gender: "Male"},
 {id: 13, first_name: "Goldina", last_name: "Rollinson", email: "grollinsonc@ask.com", gender: "Female"},
 {id: 14, first_name: "Dore", last_name: "Ohm", email: "dohmd@wunderground.com", gender: "Male"},
 {id: 15, first_name: "Falkner", last_name: "Durdy", email: "fdurdye@freewebs.com", gender: "Male"},
 {id: 16, first_name: "Nancee", last_name: "Lynett", email: "nlynettf@yale.edu", gender: "Genderqueer"},
 {id: 17, first_name: "Bruis", last_name: "Deneve", email: "bdeneveg@google.com", gender: "Male"},
 {id: 18, first_name: "Roda", last_name: "Shills", email: "rshillsh@nationalgeographic.com", gender: "Female"},
 {id: 19, first_name: "Benita", last_name: "Coldtart", email: "bcoldtarti@diigo.com", gender: "Female"},
 {id: 20, first_name: "Connie", last_name: "Prall", email: "cprallj@icio.us", gender: "Female"},
 {id: 21, first_name: "Faina", last_name: "Paler", email: "fpalerk@wunderground.com", gender: "Female"},
 {id: 22, first_name: "Uri", last_name: "Pettegree", email: "upettegreel@reference.com", gender: "Male"},
 {id: 23, first_name: "Malissa", last_name: "Boughey", email: "mbougheym@hud.gov", gender: "Female"},
 {id: 24, first_name: "Ruperta", last_name: "Belly", email: "rbellyn@livejournal.com", gender: "Female"},
 {id: 25, first_name: "Louie", last_name: "Bentjens", email: "lbentjenso@ning.com", gender: "Genderqueer"},
 {id: 26, first_name: "Wolfie", last_name: "Kornas", email: "wkornasp@unesco.org", gender: "Male"},
 {id: 27, first_name: "Blondie", last_name: "Stretton", email: "bstrettonq@yandex.ru", gender: "Female"},
 {id: 28, first_name: "Susan", last_name: "Routledge", email: "sroutledger@fema.gov", gender: "Female"},
 {id: 29, first_name: "Wendye", last_name: "Mannooch", email: "wmannoochs@reuters.com", gender: "Female"},
 {id: 30, first_name: "Tobias", last_name: "Pre", email: "tpret@stumbleupon.com", gender: "Agender"},
 {id: 31, first_name: "Lucretia", last_name: "Osant", email: "losantu@unc.edu", gender: "Female"},
 {id: 32, first_name: "Chickie", last_name: "McCraine", email: "cmccrainev@sciencedirect.com", gender: "Male"},
 {id: 33, first_name: "Margarita", last_name: "Ruskin", email: "mruskinw@stanford.edu", gender: "Female"},
 {id: 34, first_name: "Rock", last_name: "Lejeune", email: "rlejeunex@1und1.de", gender: "Male"},
 {id: 35, first_name: "Agosto", last_name: "Winders", email: "awindersy@time.com", gender: "Male"},
 {id: 36, first_name: "Nady", last_name: "Piatkowski", email: "npiatkowskiz@alibaba.com", gender: "Female"},
 {id: 37, first_name: "Norrie", last_name: "Berndsen", email: "nberndsen10@moonfruit.com", gender: "Male"},
 {id: 38, first_name: "Arlyn", last_name: "Maffezzoli", email: "amaffezzoli11@biglobe.ne.jp", gender: "Female"},
 {id: 39, first_name: "Marcie", last_name: "Balwin", email: "mbalwin12@mayoclinic.com", gender: "Female"},
 {id: 40, first_name: "Fionnula", last_name: "MacMenemy", email: "fmacmenemy13@lulu.com", gender: "Female"},
 {id: 41, first_name: "Nelly", last_name: "Raynard", email: "nraynard14@census.gov", gender: "Female"},
 {id: 42, first_name: "Ilario", last_name: "Durbann", email: "idurbann15@instagram.com", gender: "Male"},
 {id: 43, first_name: "Carma", last_name: "Buggy", email: "cbuggy16@networkadvertising.org", gender: "Female"},
 {id: 44, first_name: "Joy", last_name: "Antecki", email: "jantecki17@vinaora.com", gender: "Female"},
 {id: 45, first_name: "Julio", last_name: "Jillings", email: "jjillings18@sitemeter.com", gender: "Male"},
 {id: 46, first_name: "Modestine", last_name: "Errichelli", email: "merrichelli19@sciencedaily.com", gender: "Female"},
 {id: 47, first_name: "Cacilia", last_name: "Druhan", email: "cdruhan1a@illinois.edu", gender: "Female"},
 {id: 48, first_name: "Johannes", last_name: "Sives", email: "jsives1b@wikimedia.org", gender: "Male"},
 {id: 49, first_name: "Andonis", last_name: "Rosevear", email: "arosevear1c@nasa.gov", gender: "Male"},
 {id: 50, first_name: "Tann", last_name: "Whitear", email: "twhitear1d@facebook.com", gender: "Male"},
 {id: 51, first_name: "Dallon", last_name: "Van Leeuwen", email: "dvanleeuwen1e@themeforest.net", gender: "Male"},
 {id: 52, first_name: "Milena", last_name: "Keaveny", email: "mkeaveny1f@goodreads.com", gender: "Female"},
 {id: 53, first_name: "Lelia", last_name: "De la Barre", email: "ldelabarre1g@wikia.com", gender: "Female"},
 {id: 54, first_name: "Francoise", last_name: "Ladley", email: "fladley1h@slashdot.org", gender: "Female"},
 {id: 55, first_name: "Aura", last_name: "Tolomelli", email: "atolomelli1i@tmall.com", gender: "Female"},
 {id: 56, first_name: "Morgana", last_name: "Halley", email: "mhalley1j@usnews.com", gender: "Female"},
 {id: 57, first_name: "Oates", last_name: "Saffill", email: "osaffill1k@ucoz.com", gender: "Male"},
 {id: 58, first_name: "Bartholomeus", last_name: "Fellis", email: "bfellis1l@ifeng.com", gender: "Male"},
 {id: 59, first_name: "Nancie", last_name: "Brok", email: "nbrok1m@webmd.com", gender: "Female"},
 {id: 60, first_name: "Carlyn", last_name: "O'Dreain", email: "codreain1n@bluehost.com", gender: "Female"},
 {id: 61, first_name: "Jenine", last_name: "Silliman", email: "jsilliman1o@amazonaws.com", gender: "Female"},
 {id: 62, first_name: "Alia", last_name: "Cowpland", email: "acowpland1p@biblegateway.com", gender: "Female"},
 {id: 63, first_name: "Marian", last_name: "Fritter", email: "mfritter1q@cdbaby.com", gender: "Bigender"},
 {id: 64, first_name: "Pincus", last_name: "Pettie", email: "ppettie1r@jiathis.com", gender: "Male"},
 {id: 65, first_name: "Fara", last_name: "Reston", email: "freston1s@weather.com", gender: "Female"},
 {id: 66, first_name: "Killy", last_name: "Vegas", email: "kvegas1t@privacy.gov.au", gender: "Male"},
 {id: 67, first_name: "Astrix", last_name: "Savell", email: "asavell1u@xinhuanet.com", gender: "Female"},
 {id: 68, first_name: "Diena", last_name: "Ragbourn", email: "dragbourn1v@ocn.ne.jp", gender: "Female"},
 {id: 69, first_name: "Pete", last_name: "Korn", email: "pkorn1w@deviantart.com", gender: "Male"},
 {id: 70, first_name: "Everard", last_name: "Roblin", email: "eroblin1x@house.gov", gender: "Male"},
 {id: 71, first_name: "Georgiana", last_name: "Oram", email: "goram1y@nytimes.com", gender: "Female"},
 {id: 72, first_name: "Romona", last_name: "Kyngdon", email: "rkyngdon1z@nydailynews.com", gender: "Female"},
 {id: 73, first_name: "Pepito", last_name: "Derges", email: "pderges20@goodreads.com", gender: "Male"},
 {id: 74, first_name: "Brendin", last_name: "Prandi", email: "bprandi21@bbc.co.uk", gender: "Male"},
 {id: 75, first_name: "Gav", last_name: "Keoghan", email: "gkeoghan22@mail.ru", gender: "Male"},
 {id: 76, first_name: "Jacintha", last_name: "Osant", email: "josant23@bloomberg.com", gender: "Female"},
 {id: 77, first_name: "Aldric", last_name: "Del Castello", email: "adelcastello24@google.ca", gender: "Male"},
 {id: 78, first_name: "Joby", last_name: "Robun", email: "jrobun25@1und1.de", gender: "Female"},
 {id: 79, first_name: "Meagan", last_name: "Lawtey", email: "mlawtey26@ihg.com", gender: "Polygender"},
 {id: 80, first_name: "Moll", last_name: "Pudney", email: "mpudney27@upenn.edu", gender: "Female"},
 {id: 81, first_name: "Shaylynn", last_name: "Solley", email: "ssolley28@about.com", gender: "Female"},
 {id: 82, first_name: "Berke", last_name: "Cudiff", email: "bcudiff29@tinypic.com", gender: "Male"},
 {id: 83, first_name: "Gwendolyn", last_name: "Lilleman", email: "glilleman2a@flickr.com", gender: "Female"},
 {id: 84, first_name: "Inessa", last_name: "Dyne", email: "idyne2b@reference.com", gender: "Polygender"},
 {id: 85, first_name: "Jemimah", last_name: "Labbati", email: "jlabbati2c@ca.gov", gender: "Female"},
 {id: 86, first_name: "Katrine", last_name: "Gatrell", email: "kgatrell2d@free.fr", gender: "Female"},
 {id: 87, first_name: "Erasmus", last_name: "Hynson", email: "ehynson2e@oaic.gov.au", gender: "Male"},
 {id: 88, first_name: "Marjie", last_name: "De Vries", email: "mdevries2f@g.co", gender: "Female"},
 {id: 89, first_name: "Andree", last_name: "Getsham", email: "agetsham2g@rediff.com", gender: "Female"},
 {id: 90, first_name: "Silvia", last_name: "Huet", email: "shuet2h@illinois.edu", gender: "Female"},
 {id: 91, first_name: "Ruben", last_name: "Yetman", email: "ryetman2i@hatena.ne.jp", gender: "Male"},
 {id: 92, first_name: "Chadd", last_name: "Ludlem", email: "cludlem2j@wordpress.com", gender: "Male"},
 {id: 93, first_name: "Giustina", last_name: "Wilsher", email: "gwilsher2k@dailymotion.com", gender: "Female"},
 {id: 94, first_name: "Giavani", last_name: "Leishman", email: "gleishman2l@loc.gov", gender: "Genderfluid"},
 {id: 95, first_name: "Leon", last_name: "Monan", email: "lmonan2m@mapquest.com", gender: "Male"},
 {id: 96, first_name: "Grissel", last_name: "Bonnell", email: "gbonnell2n@bing.com", gender: "Female"},
 {id: 97, first_name: "Humfrey", last_name: "Sedge", email: "hsedge2o@auda.org.au", gender: "Male"},
 {id: 98, first_name: "Brianne", last_name: "Laming", email: "blaming2p@google.com", gender: "Female"},
 {id: 99, first_name: "Arte", last_name: "Errol", email: "aerrol2q@t.co", gender: "Male"},
 {id: 100, first_name: "Phyllys", last_name: "Roset", email: "proset2r@house.gov", gender: "Female"},
 {id: 101, first_name: "Rowena", last_name: "Drillingcourt", email: "rdrillingcourt2s@economist.com", gender: "Female"},
 {id: 102, first_name: "Zerk", last_name: "Demicoli", email: "zdemicoli2t@wordpress.org", gender: "Male"},
 {id: 103, first_name: "Aylmar", last_name: "Streight", email: "astreight2u@amazon.co.uk", gender: "Male"},
 {id: 104, first_name: "Rheba", last_name: "O'Hare", email: "rohare2v@virginia.edu", gender: "Female"},
 {id: 105, first_name: "Simeon", last_name: "Boecke", email: "sboecke2w@accuweather.com", gender: "Male"},
 {id: 106, first_name: "Carry", last_name: "Filippov", email: "cfilippov2x@who.int", gender: "Female"},
 {id: 107, first_name: "Alford", last_name: "Scotchmor", email: "ascotchmor2y@geocities.jp", gender: "Male"},
 {id: 108, first_name: "Joceline", last_name: "Terron", email: "jterron2z@auda.org.au", gender: "Female"},
 {id: 109, first_name: "Heinrick", last_name: "Kupker", email: "hkupker30@scientificamerican.com", gender: "Male"},
 {id: 110, first_name: "Maurine", last_name: "Bargh", email: "mbargh31@domainmarket.com", gender: "Female"},
 {id: 111, first_name: "Antony", last_name: "Carneck", email: "acarneck32@tripadvisor.com", gender: "Male"},
 {id: 112, first_name: "Gillian", last_name: "Blazejewski", email: "gblazejewski33@marketwatch.com", gender: "Female"},
 {id: 113, first_name: "Reggie", last_name: "Arnholtz", email: "rarnholtz34@nih.gov", gender: "Male"},
 {id: 114, first_name: "Godiva", last_name: "Pellamont", email: "gpellamont35@forbes.com", gender: "Female"},
 {id: 115, first_name: "Nike", last_name: "Scadden", email: "nscadden36@go.com", gender: "Female"},
 {id: 116, first_name: "Tripp", last_name: "Caskey", email: "tcaskey37@yolasite.com", gender: "Male"},
 {id: 117, first_name: "Karlotte", last_name: "Gregg", email: "kgregg38@cbslocal.com", gender: "Female"},
 {id: 118, first_name: "Paige", last_name: "Renn", email: "prenn39@angelfire.com", gender: "Male"},
 {id: 119, first_name: "Corilla", last_name: "Bellay", email: "cbellay3a@eepurl.com", gender: "Female"},
 {id: 120, first_name: "Odelia", last_name: "Gillebride", email: "ogillebride3b@hostgator.com", gender: "Female"},
 {id: 121, first_name: "Sarene", last_name: "Jedrzaszkiewicz", email: "sjedrzaszkiewicz3c@blinklist.com", gender: "Agender"},
 {id: 122, first_name: "April", last_name: "Sparshott", email: "asparshott3d@google.ca", gender: "Female"},
 {id: 123, first_name: "Ber", last_name: "Howkins", email: "bhowkins3e@tamu.edu", gender: "Male"},
 {id: 124, first_name: "Darya", last_name: "Aisbett", email: "daisbett3f@about.com", gender: "Female"},
 {id: 125, first_name: "Gabriel", last_name: "Speake", email: "gspeake3g@google.co.uk", gender: "Female"},
 {id: 126, first_name: "Woodie", last_name: "Morrott", email: "wmorrott3h@hostgator.com", gender: "Male"},
 {id: 127, first_name: "Cly", last_name: "Hendriksen", email: "chendriksen3i@mashable.com", gender: "Male"},
 {id: 128, first_name: "Emmie", last_name: "Kramer", email: "ekramer3j@vkontakte.ru", gender: "Female"},
 {id: 129, first_name: "Kelby", last_name: "Ramshay", email: "kramshay3k@addthis.com", gender: "Male"},
 {id: 130, first_name: "Hurlee", last_name: "Dyett", email: "hdyett3l@statcounter.com", gender: "Male"},
 {id: 131, first_name: "Minette", last_name: "Baraja", email: "mbaraja3m@gravatar.com", gender: "Female"},
 {id: 132, first_name: "Rube", last_name: "Leckey", email: "rleckey3n@shop-pro.jp", gender: "Male"},
 {id: 133, first_name: "Frannie", last_name: "Pfleger", email: "fpfleger3o@spotify.com", gender: "Male"},
 {id: 134, first_name: "Rodolphe", last_name: "Yarrell", email: "ryarrell3p@wikipedia.org", gender: "Male"},
 {id: 135, first_name: "Myron", last_name: "Ruckert", email: "mruckert3q@opensource.org", gender: "Male"},
 {id: 136, first_name: "Belicia", last_name: "Sansun", email: "bsansun3r@wix.com", gender: "Female"},
 {id: 137, first_name: "Cammie", last_name: "Sutterby", email: "csutterby3s@icq.com", gender: "Female"},
 {id: 138, first_name: "Izabel", last_name: "Murrhaupt", email: "imurrhaupt3t@arizona.edu", gender: "Female"},
 {id: 139, first_name: "Grenville", last_name: "Bentley", email: "gbentley3u@ovh.net", gender: "Male"},
 {id: 140, first_name: "Auberta", last_name: "Clemson", email: "aclemson3v@narod.ru", gender: "Female"},
 {id: 141, first_name: "Donnajean", last_name: "Armfirld", email: "darmfirld3w@hao123.com", gender: "Female"},
 {id: 142, first_name: "Roze", last_name: "Ruos", email: "rruos3x@github.com", gender: "Female"},
 {id: 143, first_name: "Jyoti", last_name: "Gorner", email: "jgorner3y@theguardian.com", gender: "Female"},
 {id: 144, first_name: "Wandis", last_name: "Arpur", email: "warpur3z@example.com", gender: "Female"},
 {id: 145, first_name: "Mag", last_name: "Avison", email: "mavison40@discovery.com", gender: "Female"},
 {id: 146, first_name: "Hersch", last_name: "Warbey", email: "hwarbey41@hexun.com", gender: "Male"},
 {id: 147, first_name: "Robbie", last_name: "Cardow", email: "rcardow42@furl.net", gender: "Non-binary"},
 {id: 148, first_name: "Marc", last_name: "Vaan", email: "mvaan43@cam.ac.uk", gender: "Male"},
 {id: 149, first_name: "Berthe", last_name: "Sworn", email: "bsworn44@ebay.co.uk", gender: "Female"},
 {id: 150, first_name: "Bendite", last_name: "Hambidge", email: "bhambidge45@apple.com", gender: "Female"},
 {id: 151, first_name: "Isobel", last_name: "Lewsie", email: "ilewsie46@mashable.com", gender: "Female"},
 {id: 152, first_name: "Alexandros", last_name: "De Leek", email: "adeleek47@newyorker.com", gender: "Genderqueer"},
 {id: 153, first_name: "Packston", last_name: "Punchard", email: "ppunchard48@liveinternet.ru", gender: "Male"},
 {id: 154, first_name: "Pablo", last_name: "Bramont", email: "pbramont49@reference.com", gender: "Male"},
 {id: 155, first_name: "Troy", last_name: "Jobern", email: "tjobern4a@archive.org", gender: "Male"},
 {id: 156, first_name: "Dolly", last_name: "O'Coskerry", email: "docoskerry4b@imageshack.us", gender: "Non-binary"},
 {id: 157, first_name: "Olav", last_name: "Katz", email: "okatz4c@state.tx.us", gender: "Male"},
 {id: 158, first_name: "Ariel", last_name: "McKleod", email: "amckleod4d@latimes.com", gender: "Male"},
 {id: 159, first_name: "Rodolfo", last_name: "Goody", email: "rgoody4e@biglobe.ne.jp", gender: "Male"},
 {id: 160, first_name: "Arron", last_name: "Sey", email: "asey4f@taobao.com", gender: "Male"},
 {id: 161, first_name: "Richard", last_name: "Yanukhin", email: "ryanukhin4g@tamu.edu", gender: "Male"},
 {id: 162, first_name: "Ewell", last_name: "Magnay", email: "emagnay4h@github.io", gender: "Male"},
 {id: 163, first_name: "Desmond", last_name: "McCook", email: "dmccook4i@nymag.com", gender: "Bigender"},
 {id: 164, first_name: "Hakeem", last_name: "Balhatchet", email: "hbalhatchet4j@aol.com", gender: "Male"},
 {id: 165, first_name: "Lynnette", last_name: "Greguoli", email: "lgreguoli4k@wikipedia.org", gender: "Female"},
 {id: 166, first_name: "Traci", last_name: "Foskew", email: "tfoskew4l@kickstarter.com", gender: "Female"},
 {id: 167, first_name: "Daphne", last_name: "Sleicht", email: "dsleicht4m@photobucket.com", gender: "Female"},
 {id: 168, first_name: "Madonna", last_name: "Olenin", email: "molenin4n@wikimedia.org", gender: "Female"},
 {id: 169, first_name: "Humfried", last_name: "Kerin", email: "hkerin4o@intel.com", gender: "Male"},
 {id: 170, first_name: "Elka", last_name: "Keasley", email: "ekeasley4p@ted.com", gender: "Female"},
 {id: 171, first_name: "Gustavus", last_name: "Eyckelberg", email: "geyckelberg4q@rediff.com", gender: "Male"},
 {id: 172, first_name: "Rodolfo", last_name: "Care", email: "rcare4r@merriam-webster.com", gender: "Male"},
 {id: 173, first_name: "Andreana", last_name: "Haszard", email: "ahaszard4s@wix.com", gender: "Female"},
 {id: 174, first_name: "Emmalyn", last_name: "Whiff", email: "ewhiff4t@networksolutions.com", gender: "Female"},
 {id: 175, first_name: "Barr", last_name: "Farnes", email: "bfarnes4u@miitbeian.gov.cn", gender: "Polygender"},
 {id: 176, first_name: "Jessika", last_name: "Ladbury", email: "jladbury4v@lycos.com", gender: "Female"},
 {id: 177, first_name: "Virgil", last_name: "Bernholt", email: "vbernholt4w@cpanel.net", gender: "Male"},
 {id: 178, first_name: "Ambrose", last_name: "Weathers", email: "aweathers4x@php.net", gender: "Agender"},
 {id: 179, first_name: "Evyn", last_name: "Giorio", email: "egiorio4y@phpbb.com", gender: "Male"},
 {id: 180, first_name: "Trever", last_name: "Bedward", email: "tbedward4z@ocn.ne.jp", gender: "Male"},
 {id: 181, first_name: "Christie", last_name: "Radborn", email: "cradborn50@gmpg.org", gender: "Female"},
 {id: 182, first_name: "Onofredo", last_name: "Monini", email: "omonini51@icio.us", gender: "Male"},
 {id: 183, first_name: "Abe", last_name: "Stollmeier", email: "astollmeier52@comsenz.com", gender: "Male"},
 {id: 184, first_name: "Cordy", last_name: "Fargher", email: "cfargher53@reuters.com", gender: "Female"},
 {id: 185, first_name: "Lowe", last_name: "Iddenden", email: "liddenden54@facebook.com", gender: "Male"},
 {id: 186, first_name: "Chaddy", last_name: "Pollock", email: "cpollock55@telegraph.co.uk", gender: "Male"},
 {id: 187, first_name: "Pepita", last_name: "Fellona", email: "pfellona56@about.me", gender: "Female"},
 {id: 188, first_name: "Artair", last_name: "O'Crevy", email: "aocrevy57@latimes.com", gender: "Genderfluid"},
 {id: 189, first_name: "Berry", last_name: "Whebell", email: "bwhebell58@opensource.org", gender: "Female"},
 {id: 190, first_name: "Latisha", last_name: "Simmonds", email: "lsimmonds59@utexas.edu", gender: "Female"},
 {id: 191, first_name: "Johannah", last_name: "Sewell", email: "jsewell5a@1und1.de", gender: "Female"},
 {id: 192, first_name: "Briggs", last_name: "Tarbin", email: "btarbin5b@list-manage.com", gender: "Male"},
 {id: 193, first_name: "Bell", last_name: "Candlin", email: "bcandlin5c@hibu.com", gender: "Female"},
 {id: 194, first_name: "Laurena", last_name: "Budd", email: "lbudd5d@skyrock.com", gender: "Genderqueer"},
 {id: 195, first_name: "Lindsay", last_name: "McWhannel", email: "lmcwhannel5e@weebly.com", gender: "Male"},
 {id: 196, first_name: "Lonnie", last_name: "Goult", email: "lgoult5f@cdc.gov", gender: "Male"},
 {id: 197, first_name: "Marius", last_name: "Loddy", email: "mloddy5g@indiegogo.com", gender: "Male"},
 {id: 198, first_name: "Rem", last_name: "Speirs", email: "rspeirs5h@mayoclinic.com", gender: "Male"},
 {id: 199, first_name: "Rustie", last_name: "Corryer", email: "rcorryer5i@t.co", gender: "Male"},
 {id: 200, first_name: "Jamie", last_name: "McAteer", email: "jmcateer5j@washington.edu", gender: "Female"}]);
db.agents.find({gender: "Female"}).toArray();
db.dropDatabase();
show dbs;
quit();
EOF
sleep 1
sudo systemctl stop mongod