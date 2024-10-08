CREATE TABLE IF NOT EXISTS Genre (
    id SERIAL PRIMARY KEY,
    title VARCHAR(60) NOT NULL
);    

CREATE TABLE IF NOT EXISTS Artist (
    id SERIAL PRIMARY KEY,
    artist_name VARCHAR(60) NOT NULL
);
CREATE TABLE IF NOT EXISTS Albom (
    id SERIAL PRIMARY KEY,
    title VARCHAR(60) NOT NULL,
    albom_release_year DATE NOT NULL
);    

CREATE TABLE IF NOT EXISTS Track (
    id SERIAL PRIMARY KEY,
    track_name VARCHAR(60) NOT NULL,
    duration TIME NOT NULL,
    albomID INTEGER NOT NULL REFERENCES Albom(id)
);    

CREATE TABLE IF NOT EXISTS Collections (
    id SERIAL PRIMARY KEY,
    collection_title VARCHAR(60) NOT NULL,
    collection_release_year DATE NOT NULL
);
CREATE TABLE IF NOT EXISTS GenreArtist (
    genreID INTEGER NOT NULL REFERENCES Genre(id),
    artistID INTEGER NOT NULL REFERENCES Artist(id),
    CONSTRAINT pk PRIMARY KEY (genreID, artistID)
);
CREATE TABLE IF NOT EXISTS AlbomArtist (
    albomID INTEGER NOT NULL REFERENCES Albom(id),
    artistID INTEGER NOT NULL REFERENCES Artist(id),
    CONSTRAINT pk PRIMARY KEY (albomID, artistID)
);
CREATE TABLE IF NOT EXISTS TrackCollections (
    trackID INTEGER NOT NULL REFERENCES Track(id),
    collectionID INTEGER NOT NULL REFERENCES Collections(id),
    CONSTRAINT pk PRIMARY KEY (trackID, collectionID)
);