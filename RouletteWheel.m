%===============================================================================
% Memilih orang tua menggunakan LinearFitness, yaitu nilai fitness hasil
% pen-skala-an. Pemilihan dilakukan secara proporsional sesuai dengan 
% nilai fitness-nya.
%
% Masukan 
%   UkPop : ukuran populasi atau jumlah kromosom dalam populasi
%   LinearFitness : nilai fitness yang sudah di-skala-kan
%   
% Keluaran 
%   Pindex : indeks dari kromosom yang terpilih (bernilai 1 sampai UkPop)
%
% Tanggal update 28 Desember 2004
% Suyanto - Teknik Informatika - Sekolah Tinggi Teknologi Telkom 
% Jl Telekomunikasi No 1 Dayeuh Kolot - Bandung 40257
%===============================================================================

function Pindex = RouletteWheel(UkPop,LinearFitness)

JumFitness = sum(LinearFitness);
KumulatifFitness  = 0;
RN = rand;
ii = 1;
while ii <= UkPop,
  KumulatifFitness = KumulatifFitness + LinearFitness(ii);
  if (KumulatifFitness/JumFitness) > RN,
    Pindex = ii;
    break;
  end
  ii = ii + 1;
end