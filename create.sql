create table if not exists author (
	id_author serial primary key,
	name_author varchar(60) not null
);


create table if not exists geenre (
	id_geenre serial primary key,
	geenre varchar(60) not null
);

create table if not exists author_geenre (
	id_author_geenre serial primary key,
	id_author int not null references author(id_author),
	id_geenre int not null references geenre(id_geenre)
);

create table if not exists albom (
	albom_id serial primary key,
	albom_name varchar(60) not null,
	yeahr_of_release date not null
);

create table if not exists aut_alb (
	aut_alb_id serial primary key,
	author_id int not null references author(id_author),
	albom_id int not null references albom(albom_id)
);

create table if not exists track (
	track_id serial primary key,
	albom_id int not null references albom(albom_id),
	name_track varchar(60) not null,
	duration int not null
);

create table if not exists collection (
	collection_id serial primary key,
	name_collection varchar (60) not null,
	yeahr_of_release date not null
);

create table if not exists track_coll (
	track_col_id serial primary key,
	track_id int not null references track(track_id),
	collection_id int not null references collection(collection_id));



