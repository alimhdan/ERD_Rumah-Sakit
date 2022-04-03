create database RUMAH_SAKIT;
use RUMAH_SAKIT;

create table antri(
no_antrian varchar(5) not null,
tanggal date not null,
hari varchar(7) not null,
jam time not null,
primary key(no_antrian)
);

create table pegawai(
id_pegawai varchar(5) not null,
nama_pegawai varchar(100) not null,
status_pegawai varchar(20) not null,
gaji numeric not null,
primary key(id_pegawai)
);

create table pasien(
no_rm varchar(20) not null,
ktp integer not null,
nama_pasien varchar(100) not null,
tgl_lahir date not null,
alamat varchar(100) not null,
tinggi smallint,
berat smallint,
ibu_kandung varchar(100),
primary key(no_rm)
);

create table poli(
id_poli smallint not null primary key,
id_peg varchar(5) not null,
nama_poli varchar(20) not null,
constraint fk_id_pegawai foreign key (id_peg) references pegawai (id_pegawai)
);

create table pembayaran(
id_pembayaran varchar(5) not null,
no_antrian varchar(5) not null,
tipe_pembayaran varchar(10) not null,
nama_instansi varchar(100),
primary key(id_pembayaran),
constraint fk_no_antrian foreign key (no_antrian) references antri (no_antrian)
);

create table dokter(
id_dokter smallint not null primary key,
id_pegawai varchar(5) not null,
id_poli smallint not null,
nama_dokter varchar(100) not null,
status_dokter varchar(20) not null,
constraint fk_id_pegawaidokter foreign key (id_pegawai) references pegawai (id_pegawai),
constraint fk_id_polidokter foreign key (id_poli) references poli (id_poli)
);

create table reservasi(
id_reservasi smallint not null primary key,
noRM varchar(20) not null,
id_poli smallint not null,
id_dokter smallint not null,
no_antrian varchar(5) not null,
constraint fk_no_rmreservasi foreign key(noRM) references pasien(no_rm),
constraint fk_id_polireservasi foreign key(id_poli) references poli(id_poli),
constraint fk_id_dokterreservasi foreign key(id_dokter) references dokter(id_dokter),
constraint fk_no_antrianreservasi foreign key(no_antrian) references antri(no_antrian)
);

select*from pegawai;
desc pegawai;
insert into pegawai(id_pegawai,nama_pegawai,status_pegawai,gaji) values
('a01','Andika Pratama','Belum Kawin',1000000),
('a02','Yudha Pratama','Belum Kawin',1500000),
('a03','Anang Prutanto','Kawin',1000000),
('a04','Junangno Adi','Belum Kawin',1230000),
('a05','Haryanto','Belum Kawin',1134000),
('a06','Yayan Setiawan','Belum Kawin',1000000),
('a07','Yandhika Nur Rohman','Belum Kawin',2000000),
('a08','Yufika Pratama','Kawin',1600000),
('a09','Yayuk Putri Utami','Belum Kawin',1700000),
('a10','Yuliana Safitri','Kawin',1590000);

desc antri;
insert into antri(no_antrian,tanggal,hari,jam) values 
('a1','2022-03-01','Senin','09:18'),
('a2','2022-03-01','Senin','09:20'),
('a3','2022-03-01','Senin','09:3'),
('a4','2022-03-05','Jumat','10:00'),
('a5','2022-03-06','Sabtu','09:45'),
('a6','2022-03-07','Minggu','09:55'),
('a7','2022-03-28','Senin','10:34'),
('a8','2022-03-29','Selasa','09:18'),
('a9','2022-03-30','Rabu','09:18'),
('a10','2022-03-30','Rabu','09:18');
select*from antri;

desc pasien;
insert into pasien(no_rm,ktp,nama_pasien,tgl_lahir,alamat,tinggi,berat,ibu_kandung) values
('rm01',12345,'Sukoco','2000-09-29','jl.Kencana No.1 Jakarta',180,78,'Sumarti'),
('rm02',12245,'Sunarno Ugik','1970-09-29','jl.Anggrek No.1 Jakarta',175,70,'Susilowati'),
('rm03',12335,'Ayu Dewi Putriani','2001-03-23','jl.Manggis Manis No.7 Jakarta',159,45,'Handayayekti'),
('rm04',14345,'Nararinda','1987-09-29','jl.Melati No.10 Jakarta',188,67,'Nanei'),
('rm05',12355,'Wnadi Aisyah','1998-09-10','jl.Kencana No.1 Jakarta',165,56,'Hyubikyo'),
('rm06',11345,'Wakijah','1965-10-11','jl.Cinta No.1 Jakarta',167,45,'Sumartini'),
('rm07',12445,'Supratni','1967-09-29','jl.Evitamala No.11 Jakarta',165,47,'Sumartinini'),
('rm08',10355,'Subagiyo','1999-09-16','jl.Kencana No.1 Jakarta',180,88,'Ayandana'),
('rm09',12555,'Marsinah','1967-09-17','jl.Maulidunnabi No.15 Jakarta',188,78,""),
('rm10',12045,'Yailahi Robbi','2001-09-29','jl.Surgawi No.1 Jakarta',179,67,'Almaidah');
select*from pasien;
-- update data yang kurang sesuai
update pasien set ibu_kandung=null where no_rm='rm09';

desc poli;
insert into poli(id_poli,id_peg,nama_poli) values
(1,'a01','Poli Akupuntur'),
(2,'a02','Poli Forensik'),
(3,'a03','Poli Tes Covid-19'),
(4,'a04','Poli Anak'),
(5,'a05','Poli Forensik'),
(6,'a06','Poli Tes Covid-19'),
(7,'a07','Poli Bedah'),
(8,'a08','Poli Gigi'),
(9,'a09','Poli Mata'),
(10,'a10','Poli Psikiater');
select*from poli;

desc pembayaran;
insert into pembayaran values
('pb01','a1','T1','BRI'),
('pb02','a2','T1','BRI'),
('pb03','a3','T2','BNI'),
('pb04','a4','T2','BNI'),
('pb05','a5','T3','MANDIRI'),
('pb06','a6','T1','BRI'),
('pb07','a7','T1','BRI'),
('pb08','a8','T2','BNI'),
('pb09','a9','T2','BNI'),
('pb010','a10','T3','MANDIRI');
SELECT*FROM PEMBAYARAN;
UPDATE PEMBAYARAN SET ID_PEMBAYARAN='pb10' where no_antrian='a10';

insert into dokter values
(11,'a01',1,'Haryanto','Ada'),
(12,'a02',2,'Handoko','Ada'),
(13,'a03',3,'Haryanti','Ada'),
(14,'a04',4,'Haranto','Ada'),
(15,'a05',5,'Harsihanti','Ada'),
(16,'a06',6,'Ali Mahmud','Ada'),
(17,'a07',7,'Mahmudan','Ada'),
(18,'a08',8,'Nanang Eko Priyanto','Ada'),
(19,'a09',9,'Haryantono','Ada'),
(110,'a10',10,'Haryanto','Ada');
select*from dokter;

insert into reservasi values
(21,'rm01',1,11,'a1'),
(22,'rm02',2,12,'a2'),
(23,'rm03',3,13,'a3'),
(24,'rm04',4,14,'a4'),
(25,'rm05',5,15,'a5'),
(26,'rm06',6,16,'a6'),
(27,'rm07',7,17,'a7'),
(28,'rm08',8,18,'a8'),
(29,'rm09',9,19,'a9'),
(210,'rm10',10,110,'a10');
select*from reservasi;