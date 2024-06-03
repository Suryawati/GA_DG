%===============================================================================
% Memindah-silangkan bagian kromosom Bapak dan Ibu yang dipotong 
% secara random, sehingga dihasilkan dua buah kromosom Anak
%
% Masukan 
%   Bapak : kromosom, matriks berukuran 1 x JumGen
%   Ibu : kromosom, matriks berukuran 1 x JumGen
%   JumGen : jumlah gen
%   
% Keluaran 
%   Anak : kromosom hasil pindah silang, matriks berukuran 1 x JumGen
%
% Tanggal update 28 Desember 2004
% Suyanto - Teknik Informatika - Sekolah Tinggi Teknologi Telkom 
% Jl Telekomunikasi No 1 Dayeuh Kolot - Bandung 40257
%===============================================================================

function Anak = PindahSilang(Bapak,Ibu,JumGen)

% Membangkitkan satu titik potong (TP bernilai antara 1 sampai JumGen-1)
TP = 1 + fix(rand*(JumGen-1));

% Anak 1 berisi bagian depan Bapak dan bagian belakang Ibu
Anak(1,:) = [Bapak(1:TP) Ibu(TP+1:JumGen)];
Anak(2,:) = [Ibu(1:TP) Bapak(TP+1:JumGen)];