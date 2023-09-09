select name_track, duration
from track
where duration = (select max(duration) from track);

select name_track, duration
from track
where duration > 4;

select name_collection, yeahr_of_release 
from collection
where yeahr_of_release between '2018,01,01' and '2022,01,01';

select name_author
from author
where name_author not like '% %';

select name_track
from track
where lower(name_track) like 'мой %' or lower(name_track) like '% мой' or lower(name_track) like '% мой %' or lower(name_track) like 'мой' 
or lower(name_track) like 'day %' or lower(name_track) like '% day' or lower(name_track) like '% day %' or lower(name_track) like 'day';




select geenre, count (name_author) from author a 
join author_geenre ag  on a.id_author = ag.id_geenre 
join geenre g on ag.id_geenre = g.id_geenre
group by g.id_geenre;


select count (name_track) from track t
join albom a on a.albom_id = t.track_id 
where a.yeahr_of_release between '2007,01,01' and '2008,01,01';


select albom_name, avg(duration) from track t 
join albom a on a.albom_id = t.albom_id 
group by a.albom_name 

select avg(duration), albom_name from albom a 
join track t on t.albom_id = a.albom_id 
group by a.albom_name 

select name_author from author a 
where name_author not in (
select name_author from albom al
join aut_alb aa on al.albom_id = aa.albom_id 
join author a on aa.author_id = a.id_author 
where al.yeahr_of_release between '2008,01,01' and '2008,12,31'
);

select name_collection from collection c 
join track_coll tc on c.collection_id = tc.collection_id 
join track t on tc.track_id = t.track_id 
join albom a on t.albom_id = a.albom_id 
join aut_alb aa on a.albom_id = aa.albom_id 
join author a2 on aa.author_id = a2.id_author 
where a2.name_author like 'Oleg';

