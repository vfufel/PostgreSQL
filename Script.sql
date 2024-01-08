CREATE TABLE IF NOT EXISTS Singer (
	singer_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS SingerGenre (
	singer_id INTEGER REFERENCES Singer(singer_id),
	genre_id INTEGER REFERENCES Genre(genre_id),
	CONSTRAINT sg PRIMARY KEY (singer_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS AlbumSinger (
	singer_id INTEGER REFERENCES Singer(singer_id),
	album_id INTEGER REFERENCES Album(album_id),
	CONSTRAINT sa PRIMARY KEY (singer_id, album_id)
);

CREATE TABLE IF NOT EXISTS Song (
	song_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	length INTEGER NOT NULL,
	album_id INTEGER NOT NULL REFERENCES Album(album_id)
);

CREATE TABLE IF NOT EXISTS Collection (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS SongCollection (
	song_id INTEGER REFERENCES Song(song_id),
	collection_id INTEGER REFERENCES Collection(collection_id),
	CONSTRAINT sc PRIMARY KEY (song_id, collection_id)
);