CREATE DATABASE gophersearch;
\c gophersearch;

drop extension pgcrypto;
CREATE EXTENSION pgcrypto;
DROP TABLE if exists gophers;
CREATE TABLE gophers (
	id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT,
	location TEXT,
	keywords TEXT,
	created_at DATE NOT NULL DEFAULT now(),
	updated_at DATE NOT NULL DEFAULT now()
);



INSERT INTO gophers (title, location,keywords)
VALUES ('7TH BIRTHDAY','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/7TH_BIRTHDAY.png','7th birthday');

INSERT INTO gophers (title, location,keywords)
VALUES ('ASHLEY STEVE','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/ASHLEY_STEVE.png','ashley steve');

INSERT INTO gophers (title, location,keywords)
VALUES ('Azure Bit Gopher','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/Azure_Bit_Gopher.png','azure bit gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('Azure Gophers','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/Azure_Gophers.png','azure gophers');

INSERT INTO gophers (title, location,keywords)
VALUES ('BATMAN GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/BATMAN_GOPHER.png','batman gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('BELGIUM','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/BELGIUM.png','belgium');

INSERT INTO gophers (title, location,keywords)
VALUES ('BLUE GLASSES GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/BLUE_GLASSES_GOPHER.png','blue glasses gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('BLUE GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/BLUE_GOPHER.png','blue gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('BUFFALO CASTS','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/BUFFALO_CASTS.png','buffalo casts');

INSERT INTO gophers (title, location,keywords)
VALUES ('Biker Gopher','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/Biker_Gopher.png','biker gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('BuffaloCast','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/BuffaloCast.png','buffalocast');

INSERT INTO gophers (title, location,keywords)
VALUES ('COMING SOON GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/COMING_SOON_GOPHER.png','coming soon gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('COWBOY GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/COWBOY_GOPHER.png','cowboy gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('CouchPotatoGopher','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/CouchPotatoGopher.png','couchpotatogopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('DRAWING GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/DRAWING_GOPHER.png','drawing gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('DockerGopher','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/DockerGopher.png','dockergopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('Doctor Who Gopher','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/Doctor_Who_Gopher.png','doctor who gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('Doctor Who Gopher Woman','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/Doctor_Who_Gopher_Woman.png','doctor who gopher woman');

INSERT INTO gophers (title, location,keywords)
VALUES ('FRANCESC','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/FRANCESC.png','francesc');

INSERT INTO gophers (title, location,keywords)
VALUES ('Facepalm Gopher','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/Facepalm_Gopher.png','facepalm gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('Facepalm Picard Gopher','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/Facepalm_Picard_Gopher.png','facepalm picard gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('GIRL GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GIRL_GOPHER.png','girl gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('GOOGLE','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOOGLE.png','google');

INSERT INTO gophers (title, location,keywords)
VALUES ('GOPHER ACADEMY','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHER%20ACADEMY.png','gopher academy');

INSERT INTO gophers (title, location,keywords)
VALUES ('GOPHERCON','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHERCON.png','gophercon');

INSERT INTO gophers (title, location,keywords)
VALUES ('GOPHER ADADEMY','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHER_ADADEMY.png','gopher adademy');

INSERT INTO gophers (title, location,keywords)
VALUES ('GOPHER DAD','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHER_DAD.png','gopher dad');

INSERT INTO gophers (title, location,keywords)
VALUES ('GOPHER DENVER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHER_DENVER.png','gopher denver');

INSERT INTO gophers (title, location,keywords)
VALUES ('GOPHER INCLUSION','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHER_INCLUSION.png','gopher inclusion');

INSERT INTO gophers (title, location,keywords)
VALUES ('GOPHER LAPTOP','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHER_LAPTOP.png','gopher laptop');

INSERT INTO gophers (title, location,keywords)
VALUES ('GOPHER LEARN','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHER_LEARN.png','gopher learn');

INSERT INTO gophers (title, location,keywords)
VALUES ('GOPHER LINK','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHER_LINK.png','gopher link');

INSERT INTO gophers (title, location,keywords)
VALUES ('GOPHER MIC DROP','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHER_MIC_DROP.png','gopher mic drop');

INSERT INTO gophers (title, location,keywords)
VALUES ('GOPHER MIC DROP WITH BACKGROUND','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHER_MIC_DROP_WITH_BACKGROUND.png','gopher mic drop with background');

INSERT INTO gophers (title, location,keywords)
VALUES ('GOPHER SAFARI','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHER_SAFARI.png','gopher safari');

INSERT INTO gophers (title, location,keywords)
VALUES ('GOPHER SHARE','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHER_SHARE.png','gopher share');

INSERT INTO gophers (title, location,keywords)
VALUES ('GOPHER STAR WARS','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GOPHER_STAR_WARS.png','gopher star wars');

INSERT INTO gophers (title, location,keywords)
VALUES ('GO BUFFALO','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GO_BUFFALO.png','go buffalo');

INSERT INTO gophers (title, location,keywords)
VALUES ('GO BUILD','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GO_BUILD.png','go build');

INSERT INTO gophers (title, location,keywords)
VALUES ('GO LEARN','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GO_LEARN.png','go learn');

INSERT INTO gophers (title, location,keywords)
VALUES ('GoBuild','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GoBuild.png','gobuild');

INSERT INTO gophers (title, location,keywords)
VALUES ('GoCommunity','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GoCommunity.png','gocommunity');

INSERT INTO gophers (title, location,keywords)
VALUES ('GopherBatman','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GopherBatman.png','gopherbatman');

INSERT INTO gophers (title, location,keywords)
VALUES ('GopherInclusion','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GopherInclusion.png','gopherinclusion');

INSERT INTO gophers (title, location,keywords)
VALUES ('GopherKubernetes','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GopherKubernetes.png','gopherkubernetes');

INSERT INTO gophers (title, location,keywords)
VALUES ('GopherLink','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GopherLink.png','gopherlink');

INSERT INTO gophers (title, location,keywords)
VALUES ('GopherSpaceCommunity','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GopherSpaceCommunity.png','gopherspacecommunity');

INSERT INTO gophers (title, location,keywords)
VALUES ('GopherSpaceMentor','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/GopherSpaceMentor.png','gopherspacementor');

INSERT INTO gophers (title, location,keywords)
VALUES ('Gopher Band','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/Gopher_Band.png','gopher band');

INSERT INTO gophers (title, location,keywords)
VALUES ('Gopher Microsoft','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/Gopher_Microsoft.png','gopher microsoft');

INSERT INTO gophers (title, location,keywords)
VALUES ('HALLOWEEN GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/HALLOWEEN_GOPHER.png','halloween gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('HASHICORP GOPHERS','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/HASHICORP_GOPHERS.png','hashicorp gophers');

INSERT INTO gophers (title, location,keywords)
VALUES ('Heptio Gophers','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/Heptio_Gophers.png','heptio gophers');

INSERT INTO gophers (title, location,keywords)
VALUES ('Hugging Gophers','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/Hugging_Gophers.png','hugging gophers');

INSERT INTO gophers (title, location,keywords)
VALUES ('KUBERNETES GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/KUBERNETES_GOPHER.png','kubernetes gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('Kubernetes Gophers','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/Kubernetes_Gophers.png','kubernetes gophers');

INSERT INTO gophers (title, location,keywords)
VALUES ('LION GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/LION_GOPHER.png','lion gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('LazyGopher','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/LazyGopher.png','lazygopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('MOTORCYCLE GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/MOTORCYCLE_GOPHER.png','motorcycle gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('MovingGopher','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/MovingGopher.png','movinggopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('NERDY','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/NERDY.png','nerdy');

INSERT INTO gophers (title, location,keywords)
VALUES ('PINK GLASSES GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/PINK_GLASSES_GOPHER.png','pink glasses gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('PINK GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/PINK_GOPHER.png','pink gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('PRIDE','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/PRIDE.png','pride');

INSERT INTO gophers (title, location,keywords)
VALUES ('RickAndMorty','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/RickAndMorty.png','rickandmorty');

INSERT INTO gophers (title, location,keywords)
VALUES ('SPACEGIRL1','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/SPACEGIRL1.png','spacegirl1');

INSERT INTO gophers (title, location,keywords)
VALUES ('SPACEGIRL GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/SPACEGIRL_GOPHER.png','spacegirl gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('STAR TREK GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/STAR_TREK_GOPHER.png','star trek gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('StrangerThingsGophers','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/StrangerThingsGophers.png','strangerthingsgophers');

INSERT INTO gophers (title, location,keywords)
VALUES ('TEACHING GOPHER','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/TEACHING_GOPHER.png','teaching gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('This is Fine Gopher','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/This_is_Fine_Gopher.png','this is fine gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('Unicorn Gopher','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/Unicorn_Gopher.png','unicorn gopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('WOMEN WHO GO','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/WOMEN_WHO_GO.png','women who go');

INSERT INTO gophers (title, location,keywords)
VALUES ('WonderWomanGopher','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/WonderWomanGopher.png','wonderwomangopher');

INSERT INTO gophers (title, location,keywords)
VALUES ('ZERO FUCKS','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/ZERO_FUCKS.png','zero fucks');

INSERT INTO gophers (title, location,keywords)
VALUES ('gopivotal','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/gopivotal.png','gopivotal');

INSERT INTO gophers (title, location,keywords)
VALUES ('pride1','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/pride1.png','pride1');

INSERT INTO gophers (title, location,keywords)
VALUES ('pride circle','https://raw.githubusercontent.com/ashleymcnamara/gophers/master/pride_circle.png','pride circle');
