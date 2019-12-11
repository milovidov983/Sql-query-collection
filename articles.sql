--- articles table
create table articles
(
    id    serial not null
        constraint articles_pk
            primary key,
    title text
);

create unique index articles_id_uindex
    on articles (id);

-- tags table
create table tags
(
    id    integer,
    title text
);

create unique index tags_id_uindex
    on tags (id);


-- link table
create table articles_tags
(
    article_id integer,
    tag_id     integer
);


-- sql script
select *
from articles as a
left join articles_tags a_t
    on a.id = a_t.article_id
left join tags t
    on a_t.tag_id = t.id
