CREATE DATABASE akademikdb;

USE akademikdb;

-- Tabel Mahasiswa
CREATE TABLE Mahasiswa (
    MahasiswaID INT PRIMARY KEY,
    Nama VARCHAR(100),
    Alamat TEXT,
    TanggalLahir DATE,
    NoHP VARCHAR(15)
);

-- Tabel Dosen
CREATE TABLE Dosen (
    DosenID INT PRIMARY KEY,
    Nama VARCHAR(100),
    Email VARCHAR(100),
    NoHP VARCHAR(15)
);

-- Tabel MataKuliah
CREATE TABLE MataKuliah (
    MataKuliahID INT PRIMARY KEY,
    NamaMK VARCHAR(100),
    SKS INT,
    Semester INT
);

-- Tabel Kelas
CREATE TABLE Kelas (
    KelasID INT PRIMARY KEY,
    MataKuliahID INT,
    DosenID INT,
    TahunAkademik VARCHAR(10),
    FOREIGN KEY (MataKuliahID) REFERENCES MataKuliah(MataKuliahID),
    FOREIGN KEY (DosenID) REFERENCES Dosen(DosenID)
);

-- Tabel Nilai
CREATE TABLE Nilai (
    NilaiID INT PRIMARY KEY,
    MahasiswaID INT,
    KelasID INT,
    Nilai DECIMAL(5,2),
    FOREIGN KEY (MahasiswaID) REFERENCES Mahasiswa(MahasiswaID),
    FOREIGN KEY (KelasID) REFERENCES Kelas(KelasID)
);



-- Tabel Mahasiswa
INSERT INTO Mahasiswa (MahasiswaID, Nama, Alamat, TanggalLahir, NoHP) VALUES
(1, 'Ali Fauzan', 'Surabaya', '2000-01-15', '081234567890'),
(2, 'Budi Santoso', 'Malang', '1999-05-21', '082345678901'),
(3, 'Citra Lestari', 'Sidoarjo', '2001-03-10', '083456789012'),
(4, 'Deni Kurniawan', 'Gresik', '2000-07-25', '084567890123'),
(5, 'Eka Putri', 'Lamongan', '2001-09-18', '085678901234');

-- Tabel Dosen
INSERT INTO Dosen (DosenID, Nama, Email, NoHP) VALUES
(10, 'Dr. Rina Widya', 'rina.widya@univ.ac.id', '081122334455'),
(11, 'Dr. Yusuf Malik', 'yusuf.malik@univ.ac.id', '082233445566'),
(12, 'Dr. Sinta Dewi', 'sinta.dewi@univ.ac.id', '083344556677'),
(13, 'Dr. Arif Hidayat', 'arif.hidayat@univ.ac.id', '084455667788'),
(14, 'Dr. Lestari Nur', 'lestari.nur@univ.ac.id', '085566778899');

-- Tabel MataKuliah
INSERT INTO MataKuliah (MataKuliahID, NamaMK, SKS, Semester) VALUES
(100, 'Basis Data', 3, 4),
(101, 'Algoritma dan Pemrograman', 3, 2),
(102, 'Matematika Diskrit', 2, 2),
(103, 'Sistem Operasi', 3, 3),
(104, 'Jaringan Komputer', 2, 4);

-- Tabel Kelas
INSERT INTO Kelas (KelasID, MataKuliahID, DosenID, TahunAkademik) VALUES
(201, 100, 10, '2024/2025'),
(202, 101, 11, '2024/2025'),
(203, 102, 12, '2024/2025'),
(204, 103, 13, '2024/2025'),
(205, 104, 14, '2024/2025');

-- Tabel Nilai
INSERT INTO Nilai (NilaiID, MahasiswaID, KelasID, Nilai) VALUES
(301, 1, 201, 85.5),
(302, 2, 202, 90.0),
(303, 3, 203, 78.0),
(304, 4, 204, 88.0),
(305, 5, 205, 92.5);



-- INSERT
-- INSERT (data baru)
INSERT INTO Mahasiswa (MahasiswaID, Nama, Alamat, TanggalLahir, NoHP)
VALUES (6, 'Gita Pratiwi', 'Semarang', '2002-12-15', '08575553333');

INSERT INTO Dosen (DosenID, Nama, Email, NoHP)
VALUES (15, 'Dr. Rahmat Hidayah', 'rahmat.hidayah@univ.ac.id', '081299988877');

INSERT INTO MataKuliah (MataKuliahID, NamaMK, SKS, Semester)
VALUES (105, 'Kecerdasan Buatan', 3, 5);

INSERT INTO Kelas (KelasID, MataKuliahID, DosenID, TahunAkademik)
VALUES (206, 105, 15, '2024/2025');

INSERT INTO Nilai (NilaiID, MahasiswaID, KelasID, Nilai)
VALUES (306, 6, 206, 91.0);


SELECT * FROM Mahasiswa;

SELECT Nama, Nilai
FROM Mahasiswa
JOIN Nilai ON Mahasiswa.MahasiswaID = Nilai.MahasiswaID;

SELECT MataKuliah.NamaMK, Dosen.Nama
FROM Kelas
JOIN MataKuliah ON Kelas.MataKuliahID = MataKuliah.MataKuliahID
JOIN Dosen ON Kelas.DosenID = Dosen.DosenID;



UPDATE Mahasiswa
SET Alamat = 'Malang'
WHERE MahasiswaID = 2;

UPDATE Mahasiswa
SET Alamat = 'Jakarta'
WHERE MahasiswaID = 1;

UPDATE MataKuliah
SET SKS = 4
WHERE MataKuliahID = 100;

UPDATE Nilai
SET Nilai = 95.0
WHERE NilaiID = 301;



DELETE FROM Mahasiswa
WHERE MahasiswaID = 2;

DELETE FROM Nilai
WHERE NilaiID = 302;

DELETE FROM Mahasiswa
WHERE MahasiswaID = 5;

DELETE FROM Kelas
WHERE KelasID = 204;


-- A. SELECT dan WHERE
SELECT * FROM Mahasiswa;
SELECT * FROM Mahasiswa WHERE Alamat = 'malang';
SELECT * FROM Mahasiswa ORDER BY Nama ASC;

-- SELECT STATEMENTS
-- Menampilkan semua data mahasiswa
SELECT * FROM Mahasiswa;

-- Menampilkan mahasiswa dengan nilai di atas 85
SELECT m.Nama, n.Nilai
FROM Mahasiswa m
JOIN Nilai n ON m.MahasiswaID = n.MahasiswaID
WHERE n.Nilai > 85;



-- B. JOIN
-- JOIN EXAMPLES
-- JOIN BIASA (tanpa LEFT/RIGHT/INNER)

-- Contoh 1: Menampilkan semua kombinasi mahasiswa dan nilai (cross join implicit dengan kondisi)
SELECT m.Nama, n.Nilai
FROM Mahasiswa m, Nilai n
WHERE m.MahasiswaID = n.MahasiswaID;

-- Contoh 2: Menampilkan daftar kelas dan dosen pengampu (tanpa menggunakan INNER/LEFT JOIN keyword)
SELECT k.KelasID, d.Nama
FROM Kelas k, Dosen d
WHERE k.DosenID = d.DosenID;

-- Contoh 3: Menampilkan mahasiswa dan mata kuliah dari nilai yang diambil (tanpa INNER JOIN keyword)
SELECT m.Nama, mk.NamaMK
FROM Mahasiswa m, Nilai n, Kelas k, MataKuliah mk
WHERE m.MahasiswaID = n.MahasiswaID
  AND n.KelasID = k.KelasID
  AND k.MataKuliahID = mk.MataKuliahID;



-- INNER JOIN
SELECT m.Nama, mk.NamaMK, n.Nilai
FROM Nilai n
JOIN Mahasiswa m ON n.MahasiswaID = m.MahasiswaID
JOIN Kelas k ON n.KelasID = k.KelasID
JOIN MataKuliah mk ON k.MataKuliahID = mk.MataKuliahID;

-- INNER JOIN
-- Contoh 1: Menampilkan nama mahasiswa, nama mata kuliah, dan nilai
SELECT m.Nama AS NamaMahasiswa, mk.NamaMK AS MataKuliah, n.Nilai
FROM Mahasiswa m
INNER JOIN Nilai n ON m.MahasiswaID = n.MahasiswaID
INNER JOIN Kelas k ON n.KelasID = k.KelasID
INNER JOIN MataKuliah mk ON k.MataKuliahID = mk.MataKuliahID;

-- Contoh 2: Menampilkan mahasiswa dan dosen pengampu dari setiap kelas
SELECT m.Nama AS NamaMahasiswa, d.Nama AS NamaDosen
FROM Mahasiswa m
INNER JOIN Nilai n ON m.MahasiswaID = n.MahasiswaID
INNER JOIN Kelas k ON n.KelasID = k.KelasID
INNER JOIN Dosen d ON k.DosenID = d.DosenID;

-- Contoh 3: Menampilkan nama mahasiswa, kelas, dan tahun akademik
SELECT m.Nama AS NamaMahasiswa, k.KelasID, k.TahunAkademik
FROM Mahasiswa m
INNER JOIN Nilai n ON m.MahasiswaID = n.MahasiswaID
INNER JOIN Kelas k ON n.KelasID = k.KelasID;



-- LEFT JOIN
SELECT m.Nama, n.Nilai
FROM Mahasiswa m
LEFT JOIN Nilai n ON m.MahasiswaID = n.MahasiswaID;

-- LEFT JOIN
-- Contoh 1: Menampilkan semua mahasiswa, meskipun belum memiliki nilai
SELECT m.Nama, n.Nilai
FROM Mahasiswa m
LEFT JOIN Nilai n ON m.MahasiswaID = n.MahasiswaID;

-- Contoh 2: Menampilkan semua kelas dan nama mata kuliah, walaupun belum ada nilai
SELECT k.KelasID, mk.NamaMK, n.Nilai
FROM Kelas k
LEFT JOIN MataKuliah mk ON k.MataKuliahID = mk.MataKuliahID
LEFT JOIN Nilai n ON k.KelasID = n.KelasID;

-- Contoh 3: Menampilkan daftar dosen dan kelas yang diampu (jika ada)
SELECT d.Nama, k.KelasID
FROM Dosen d
LEFT JOIN Kelas k ON d.DosenID = k.DosenID;


-- RIGHT JOIN
SELECT m.Nama, n.Nilai
FROM Mahasiswa m
RIGHT JOIN Nilai n ON m.MahasiswaID = n.MahasiswaID;

-- RIGHT JOIN
-- Contoh 1: Menampilkan semua nilai beserta nama mahasiswa (jika ada)
SELECT m.Nama, n.Nilai
FROM Mahasiswa m
RIGHT JOIN Nilai n ON m.MahasiswaID = n.MahasiswaID;

-- Contoh 2: Menampilkan semua nilai dan kelas terkait (jika ada)
SELECT k.KelasID, n.Nilai
FROM Kelas k
RIGHT JOIN Nilai n ON k.KelasID = n.KelasID;

-- Contoh 3: Menampilkan nama mata kuliah dari semua kelas yang punya nilai
SELECT mk.NamaMK, n.Nilai
FROM MataKuliah mk
RIGHT JOIN Kelas k ON mk.MataKuliahID = k.MataKuliahID
RIGHT JOIN Nilai n ON k.KelasID = n.KelasID;


-- C. Laporan Akademik
-- LAPORAN AKADEMIK

-- Daftar Mahasiswa dan Mata Kuliah yang Diambil
SELECT m.Nama AS Mahasiswa, mk.NamaMK AS MataKuliah, n.Nilai
FROM Mahasiswa m
JOIN Nilai n ON m.MahasiswaID = n.MahasiswaID
JOIN Kelas k ON n.KelasID = k.KelasID
JOIN MataKuliah mk ON k.MataKuliahID = mk.MataKuliahID;

-- Jumlah Mata Kuliah yang Diambil Setiap Mahasiswa
SELECT m.Nama, COUNT(DISTINCT k.MataKuliahID) AS JumlahMK
FROM Mahasiswa m
JOIN Nilai n ON m.MahasiswaID = n.MahasiswaID
JOIN Kelas k ON n.KelasID = k.KelasID
GROUP BY m.Nama;

-- Dosen dengan Jumlah Kelas Terbanyak
SELECT d.Nama, COUNT(k.KelasID) AS JumlahKelas
FROM Dosen d
JOIN Kelas k ON d.DosenID = k.DosenID
GROUP BY d.Nama
ORDER BY JumlahKelas DESC;



-- Rata-rata Nilai per Mata Kuliah
SELECT MK.NamaMK, AVG(N.Nilai) AS RataRataNilai
FROM MataKuliah MK
JOIN Kelas K ON MK.MataKuliahID = K.MataKuliahID
JOIN Nilai N ON K.KelasID = N.KelasID
GROUP BY MK.NamaMK;

-- Rata-rata Nilai Setiap Mahasiswa
SELECT M.Nama, AVG(N.Nilai) AS RataRataNilai
FROM Mahasiswa M
JOIN Nilai N ON M.MahasiswaID = N.MahasiswaID
GROUP BY M.Nama;



-- Mahasiswa dengan Nilai Tertinggi pada Setiap Mata Kuliah
SELECT MK.NamaMK, M.Nama AS Mahasiswa, MAX(N.Nilai) AS NilaiTertinggi
FROM MataKuliah MK
JOIN Kelas K ON MK.MataKuliahID = K.MataKuliahID
JOIN Nilai N ON K.KelasID = N.KelasID
JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
GROUP BY MK.NamaMK, M.Nama
ORDER BY MK.NamaMK, NilaiTertinggi DESC;

-- Nilai Tertinggi per Mata Kuliah
SELECT MK.NamaMK, MAX(N.Nilai) AS NilaiTertinggi
FROM MataKuliah MK
JOIN Kelas K ON MK.MataKuliahID = K.MataKuliahID
JOIN Nilai N ON K.KelasID = N.KelasID
GROUP BY MK.NamaMK;

-- Mahasiswa dengan Nilai Tertinggi
SELECT M.Nama, MAX(N.Nilai) AS NilaiTertinggi
FROM Mahasiswa M
JOIN Nilai N ON M.MahasiswaID = N.MahasiswaID
GROUP BY M.Nama
ORDER BY NilaiTertinggi DESC
LIMIT 1;



-- Nilai Terendah per Mata Kuliah
SELECT MK.NamaMK, MIN(N.Nilai) AS NilaiTerendah
FROM MataKuliah MK
JOIN Kelas K ON MK.MataKuliahID = K.MataKuliahID
JOIN Nilai N ON K.KelasID = N.KelasID
GROUP BY MK.NamaMK;

-- Mahasiswa dengan Nilai Terendah
SELECT M.Nama, MIN(N.Nilai) AS NilaiTerendah
FROM Mahasiswa M
JOIN Nilai N ON M.MahasiswaID = N.MahasiswaID
GROUP BY M.Nama
ORDER BY NilaiTerendah ASC;


