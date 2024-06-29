create table users(
	id int primary key auto_increment,
    username varchar(225) unique not null,
    created_at timestamp default now()
);

create table photos(
	id int primary key auto_increment,
    image_url varchar(255) unique not null,
    user_id int,
		foreign key(user_id) references users(id),
	created_at timestamp default now()
);


create table comments(
	id int primary key auto_increment,
    comment_text varchar(255),
    user_id int,
		foreign key(user_id) references users(id),
	photo_id int,
		foreign key(photo_id) references photos(id),
    created_at timestamp default now()
);


create table likes(
	user_id int not null,
		foreign key(user_id) references users(id),
 photo_id int not null,
 	foreign key(photo_id) references photos(id),
 created_at timestamp default now(),
	primary key(user_id,photo_id)
);

create table follows(
	follower_id int not null,
		foreign key(follower_id) references users(id),
	followee_id int not null,
		foreign key(followee_id) references users(id),
	created_at timestamp default now()
);

create table tags(
	id int primary key auto_increment,
    tag_name varchar(225),
    created_at timestamp default now()
);

create table photo_tags(
	photo_id int not null,
		foreign key(photo_id) references photos(id),
	tag_id int not null,
		foreign key(tag_id) references tags(id),
	primary key(photo_id,tag_id)
);


