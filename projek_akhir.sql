
use projek_akhir;
CREATE TABLE Mahasiswa (
    MahasiswaID VARCHAR(10) PRIMARY KEY,
    Nama VARCHAR(100),
    NIM VARCHAR(20) UNIQUE,
    Tanggal_Lahir DATE,
    Jenis_Kelamin VARCHAR(10),
    Alamat VARCHAR(255),
    No_HP VARCHAR(15),
    Email VARCHAR(100),
    Program_Studi VARCHAR(100)
);

CREATE TABLE Dosen (
    DosenID VARCHAR(10) PRIMARY KEY,
    Nama VARCHAR(100),
    NIDN VARCHAR(20) UNIQUE,
    Email VARCHAR(100),
    No_HP VARCHAR(15),
    Alamat VARCHAR(255),
    Jabatan_Akademik VARCHAR(50)
);

CREATE TABLE MataKuliah (
    MataKuliahID VARCHAR(10) PRIMARY KEY,
    Nama_MataKuliah VARCHAR(100),
    SKS INT,
    Semester INT,
    DosenID VARCHAR(10),
    FOREIGN KEY (DosenID) REFERENCES Dosen(DosenID)
);

CREATE TABLE Kelas (
    KelasID VARCHAR(10) PRIMARY KEY,
    Nama_Kelas VARCHAR(50),
    Tahun_Ajaran VARCHAR(20),
    Semester INT,
    DosenID VARCHAR(10),
    FOREIGN KEY (DosenID) REFERENCES Dosen(DosenID)
);

CREATE TABLE Nilai (
    NilaiID VARCHAR(10) PRIMARY KEY,
    MahasiswaID VARCHAR(10),
    MataKuliahID VARCHAR(10),
    KelasID VARCHAR(10),
    Nilai_Akhir INT,
    FOREIGN KEY (MahasiswaID) REFERENCES Mahasiswa(MahasiswaID),
    FOREIGN KEY (MataKuliahID) REFERENCES MataKuliah(MataKuliahID),
    FOREIGN KEY (KelasID) REFERENCES Kelas(KelasID)
);


-- Mahasiswa
INSERT INTO Mahasiswa VALUES
('F001', 'Fahrel', '2409139701', '1975-01-24', 'pria', 'JL. Sumberan no. 45', '081217911', 'fahrel@gmail.com', 'Kedokteran'),
('F002', 'Fahrul', '2409139702', '1975-02-24', 'pria', 'JL. Sumberan no. 46', '081217912', 'fahrul@gmail.com', 'Ekonomi'),
('F003', 'Fahril', '2409139703', '1975-03-24', 'pria', 'JL. Sumberan no. 47', '081217913', 'fahril@gmail.com', 'Hukum'),
('F004', 'Fahrol', '2409139704', '1975-04-24', 'pria', 'JL. Sumberan no. 48', '081217914', 'fahrol@gmail.com', 'Sistem Informasi'),
('F005', 'Fahral', '2409139705', '1975-05-24', 'pria', 'JL. Sumberan no. 49', '081217915', 'fahral@gmail.com', 'Tataboga');

-- Dosen
INSERT INTO Dosen VALUES
('FD001', 'Supri', '232301', 'Supri@gmail.com', '0812177771', 'JL. Maritim no. 45', 'Rektor'),
('FD002', 'Nanang', '232302', 'Nanang@gmail.com', '0812177772', 'JL. Maritim no. 46', 'Profesor'),
('FD003', 'Toha', '232303', 'Toha@gmail.com', '0812177773', 'JL. Maritim no. 47', 'Profesor'),
('FD004', 'Didik', '232304', 'Didik@gmail.com', '0812177774', 'JL. Maritim no. 48', 'Profesor'),
('FD005', 'Yudi', '232305', 'Yudi@gmail.com', '0812177775', 'JL. Maritim no. 49', 'Kaprodi');

-- Mata Kuliah
INSERT INTO MataKuliah VALUES
('FK001', 'Biologi', 2, 7, 'FD001'),
('FK002', 'Akuntansi dasar', 2, 7, 'FD002'),
('FK003', 'Pancasila', 2, 7, 'FD003'),
('FK004', 'Basis data', 2, 7, 'FD004'),
('FK005', 'Matematika', 2, 7, 'FD005');

-- Kelas
INSERT INTO Kelas VALUES
('F1', 'FA1', '1980/1981', 7, 'FD001'),
('F2', 'FA2', '1980/1981', 7, 'FD002'),
('F3', 'FA3', '1980/1981', 7, 'FD003'),
('F4', 'FA4', '1980/1981', 7, 'FD004'),
('F5', 'FA5', '1980/1981', 7, 'FD005');

-- Nilai
INSERT INTO Nilai VALUES
('FN001', 'F001', 'FK001', 'F1', 98),
('FN002', 'F002', 'FK002', 'F2', 88),
('FN003', 'F003', 'FK003', 'F3', 87),
('FN004', 'F004', 'FK004', 'F4', 99),
('FN005', 'F005', 'FK005', 'F5', 86);



--query DDL CREATE, ALTER, DROP
-- Mengubah panjang kolom Nama di tabel Mahasiswa
create database projek_akhir;

drop DATABASE projek_akhir;

-- Mengubah panjang kolom Nama di tabel Mahasiswa
ALTER TABLE Mahasiswa
MODIFY Nama VARCHAR(150);

-- Mengubah tipe data kolom Nilai_Akhir jadi DECIMAL(5,2)
ALTER TABLE Nilai
MODIFY Nilai_Akhir DECIMAL(5,2);


-- query CRUD
-- CREATE (insert data baru ke tabel Mahasiswa)
INSERT INTO Mahasiswa VALUES
('F006', 'Fihril', '2409139706', '1975-06-24', 'bowtie', 'JL. Sumberan no. 50', '081217916', 'fihril@gmail.com', 'Seni');

-- READ (menampilkan semua data mahasiswa)
SELECT * FROM Mahasiswa;

-- UPDATE (mengubah data alamat mahasiswa F001)
UPDATE Mahasiswa
SET Alamat = 'JL. Sumberan no. 100'
WHERE MahasiswaID = 'F001';

-- DELETE (hapus mahasiswa F006)
DELETE FROM Mahasiswa
WHERE MahasiswaID = 'F006';


-- Query Lanjutan dengan WHERE, ORDER BY, GROUP BY
-- Menampilkan semua data mahasiswa
SELECT * FROM Mahasiswa;

-- Menampilkan data mahasiswa dari program studi 'Sistem Informasi'
SELECT * FROM Mahasiswa
WHERE Program_Studi = 'Sistem Informasi';

-- Menampilkan desen berdasarkan jabatan akademik rektor
SELECT * FROM Dosen
WHERE Jabatan_akademik = 'rektor';

-- WHERE (menampilkan mahasiswa dari program studi 'Ekonomi')
SELECT * FROM Mahasiswa
WHERE Program_Studi = 'Ekonomi';

-- ORDER BY (urutkan mahasiswa berdasarkan tanggal lahir paling tua ke muda)
SELECT * FROM Mahasiswa
ORDER BY Tanggal_Lahir ASC;

-- GROUP BY (jumlah mahasiswa berdasarkan program studi)
SELECT Program_Studi, COUNT(*) AS Jumlah_Mahasiswa
FROM Mahasiswa
GROUP BY Program_Studi;



--5 query JOIN
-- Menampilkan nama mahasiswa, nama mata kuliah, dan nilai akhir
SELECT M.Nama, MK.Nama_MataKuliah, N.Nilai_Akhir
FROM Nilai N
INNER JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID;

-- Menampilkan semua mahasiswa, walaupun belum memiliki nilai
SELECT M.Nama, N.Nilai_Akhir
FROM Mahasiswa M
LEFT JOIN Nilai N ON M.MahasiswaID = N.MahasiswaID;

-- Menampilkan semua nilai, dan tampilkan info mahasiswa jika ada
SELECT M.Nama, N.Nilai_Akhir
FROM Mahasiswa M
RIGHT JOIN Nilai N ON M.MahasiswaID = N.MahasiswaID;

-- Menampilkan nama kelas, dosen pengampu, dan nama mata kuliah
SELECT K.Nama_Kelas, D.Nama AS Nama_Dosen, MK.Nama_MataKuliah
FROM Kelas K
JOIN Dosen D ON K.DosenID = D.DosenID
JOIN MataKuliah MK ON K.DosenID = MK.DosenID;

-- Menampilkan mahasiswa, kelas, mata kuliah, dan nilai
SELECT M.Nama, K.Nama_Kelas, MK.Nama_MataKuliah, N.Nilai_Akhir
FROM Nilai N
JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
JOIN Kelas K ON N.KelasID = K.KelasID
JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID;




-- 5 query COUNT, AVG, MAX, MIN, SUM 
-- Jumlah total mahasiswa
SELECT COUNT(*) AS Jumlah_Mahasiswa FROM Mahasiswa;

-- Rata-rata nilai akhir semua mahasiswa
SELECT AVG(Nilai_Akhir) AS Rata_Rata_Nilai FROM Nilai;

-- Nilai akhir tertinggi
SELECT MAX(Nilai_Akhir) AS Nilai_Tertinggi FROM Nilai;

-- Nilai akhir terendah
SELECT MIN(Nilai_Akhir) AS Nilai_Terendah FROM Nilai;

-- Total keseluruhan nilai
SELECT SUM(Nilai_Akhir) AS Total_Nilai FROM Nilai;

 