insert into author(name_author)
values ('Sergey');
insert into author(name_author)
values ('Ivan');
insert into author(name_author)
values ('Oleg');
insert into author(name_author)
values ('Andrey');
insert into author(name_author)
values ('Aleksandr');
insert into author(name_author)
values ('Ura');
insert into author(name_author)
values ('Nikita');
insert into author(name_author)
values ('Slava');
insert into author(name_author)
values ('Evgeniy');

insert into geenre(geenre)
values ('Pop');
insert into geenre(geenre)
values ('Rock');
insert into geenre(geenre)
values ('Rap');
insert into geenre(geenre)
values ('Methal');
insert into geenre(geenre)
values ('Shanson');


insert into author_geenre(id_author,id_geenre)
values (1,3);
insert into author_geenre(id_author,id_geenre)
values (2,1);
insert into author_geenre(id_author,id_geenre)
values (3,4);
insert into author_geenre(id_author,id_geenre)
values (4,5);
insert into author_geenre(id_author,id_geenre)
values (5,3);
insert into author_geenre(id_author,id_geenre)
values (6,4);
insert into author_geenre(id_author,id_geenre)
values (7,1);
insert into author_geenre(id_author,id_geenre)
values (8,2);
insert into author_geenre(id_author,id_geenre)
values (9,5);

insert into albom (albom_name,yeahr_of_release)
values ('Sergeyev','2007,01,01');
insert into albom (albom_name,yeahr_of_release)
values ('Ivanov','2008,01,01'
);
insert into albom (albom_name,yeahr_of_release)
values ('Petrov','2009,01,01');
insert into albom (albom_name,yeahr_of_release)
values ('Kolokvium','2010,01,01');
insert into albom (albom_name,yeahr_of_release)
values ('Sergi','2008,01,01');
insert into albom (albom_name,yeahr_of_release)
values ('Night','2008,01,01');
insert into albom (albom_name,yeahr_of_release)
values ('Day','2010,01,01');
insert into albom (albom_name,yeahr_of_release)
values ('Moon','2011,01,01');
insert into albom (albom_name,yeahr_of_release)
values ('Solar','2011,01,01');

insert into aut_alb (author_id,albom_id)
values (1,9);
insert into aut_alb (author_id,albom_id)
values (2,8);
insert into aut_alb (author_id,albom_id)
values (3,7);
insert into aut_alb (author_id,albom_id)
values (4,6);
insert into aut_alb (author_id,albom_id)
values (5,5);
insert into aut_alb (author_id,albom_id)
values (6,4);
insert into aut_alb (author_id,albom_id)
values (7,3);
insert into aut_alb (author_id,albom_id)
values (8,2);
insert into aut_alb (author_id,albom_id)
values (9,1);


insert into track (albom_id,name_track,duration)
values (1,'fierst',2);
insert into track (albom_id,name_track,duration)
values (1,'second',3);
insert into track (albom_id,name_track,duration)
values (2,'day',3);
insert into track (albom_id,name_track,duration)
values (2,'lena',4);
insert into track (albom_id,name_track,duration)
values (3,'fierst-second',2);
insert into track (albom_id,name_track,duration)
values (3,'second-third',5);
insert into track (albom_id,name_track,duration)
values (4,'dayone',6);
insert into track (albom_id,name_track,duration)
values (4,'lenalena',4);
insert into track (albom_id,name_track,duration)
values (5,'fierst',2);
insert into track (albom_id,name_track,duration)
values (5,'second',3);
insert into track (albom_id,name_track,duration)
values (6,'day',3);
insert into track (albom_id,name_track,duration)
values (6,'lenaq',4);
insert into track (albom_id,name_track,duration)
values (7,'qfierst',3);
insert into track (albom_id,name_track,duration)
values (7,'secondno',3);
insert into track (albom_id,name_track,duration)
values (8,'daytwo',5);
insert into track (albom_id,name_track,duration)
values (8,'lenaivan',4);
insert into track (albom_id,name_track,duration)
values (9,'fierst',2);
insert into track (albom_id,name_track,duration)
values (9,'second',3);
insert into track (albom_id,name_track,duration)
values (9,'dayt',6);

insert into collection (name_collection,yeahr_of_release)
values ('namberone','2020,01,01');
insert into collection (name_collection,yeahr_of_release)
values ('nambertwo','2010,02,02');
insert into collection (name_collection,yeahr_of_release)
values ('namberone-two','2015,03,02');
insert into collection (name_collection,yeahr_of_release)
values ('namberone1','2021,01,03');
insert into collection (name_collection,yeahr_of_release)
values ('namberone2','2009,01,03');
insert into collection (name_collection,yeahr_of_release)
values ('namberone3','2010,02,03');
insert into collection (name_collection,yeahr_of_release)
values ('namberone','2018,01,01');
insert into collection (name_collection,yeahr_of_release)
values ('namberone','2020,02,02');


insert into track_coll (track_id,collection_id)
values (1,1);
insert into track_coll (track_id,collection_id)
values (2,1);
insert into track_coll (track_id,collection_id)
values (3,1);
insert into track_coll (track_id,collection_id)
values (4,3);
insert into track_coll (track_id,collection_id)
values (5,7);
insert into track_coll (track_id,collection_id)
values (6,8);
insert into track_coll (track_id,collection_id)
values (7,4);
insert into track_coll (track_id,collection_id)
values (8,6);
insert into track_coll (track_id,collection_id)
values (9,1);
insert into track_coll (track_id,collection_id)
values (10,4);
insert into track_coll (track_id,collection_id)
values (11,6);
insert into track_coll (track_id,collection_id)
values (12,4);
insert into track_coll (track_id,collection_id)
values (13,8);
insert into track_coll (track_id,collection_id)
values (14,7);
insert into track_coll (track_id,collection_id)
values (15,6);
insert into track_coll (track_id,collection_id)
values (16,5);
insert into track_coll (track_id,collection_id)
values (17,4);
insert into track_coll (track_id,collection_id)
values (18,3);
insert into track_coll (track_id,collection_id)
values (19,2);





