use social_network_pro;

-- Bai 3
select * from users
where hometown = 'hà nội';

create index idx_hometown on users(hometown);

select * from users
where hometown = 'hà nội';

drop index idx_hometown on users;


-- Bai 4
select post_id, content, created_at from posts
where user_id = 1 and year(created_at) = 2026;

create index idx_created_at_user_id on posts (created_at, user_id);

select post_id, content, created_at from posts
where user_id = 1 and year(created_at) = 2026;

select user_id, username, email from users
where email = 'an@gmail.com';

create unique index idx_email on users (email);

select user_id, username, email from users
where email = 'an@gmail.com';

drop index idx_created_at_user_id on posts;

drop index idx_email on users;


-- Bai 5 
create index idx_hometown on users(hometown);

select u.user_id, u.username, p.post_id, p.content from users u
join posts p on u.user_id = p.user_id
where u.hometown = 'hà nội'
order by u.username desc
limit 10;

select u.user_id, u.username, p.post_id, p.content from users u
join posts p on u.user_id = p.user_id
where u.hometown = 'hà nội'
order by u.username desc
limit 10;


-- Bai 6 
create view view_users_summary as
select  u.user_id, u.username, count(p.post_id) as total_posts from users u
left join posts p on u.user_id = p.user_id
group by u.user_id, u.username;

select user_id, username, total_posts from view_users_summary
where total_posts > 5;
