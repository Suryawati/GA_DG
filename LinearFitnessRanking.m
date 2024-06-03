%===============================================================================
% Men-skala-kan nilai fitness ke dalam ranking sehingga diperoleh
% nilai-nilai fitness baru yang berada dalam rentang [MaxF,MinF]
%
% Masukan 
%   UkPop : ukuran populasi atau jumlah kromosom dalam populasi
%   Fitness: nilai fitness, matriks ukuran 1 x UkPop
%   MaxF : nilai fitness maximum
%   MinF : nilai fitness minimum
%   
% Keluaran 
%   LFR : Linear Fitness Ranking
%
% Tanggal update 28 Desember 2004
% Suyanto - Teknik Informatika - Sekolah Tinggi Teknologi Telkom 
% Jl Telekomunikasi No 1 Dayeuh Kolot - Bandung 40257
%===============================================================================

function LFR = LinearFitnessRanking(UkPop,Fitness,MaxF,MinF)

% SF berisi nilai fitness yang terurut dari kecil ke besar (ascending)
% IndF berisi index dari nilai fitness yang menyatakan nomor urut kromosom
[~,IndF] = sort(Fitness);

% LinearFitness = nilai fitness baru hasil pen-skala-an
LFR=zeros(UkPop,1);
for rr=1:UkPop,
  LFR(IndF(UkPop-rr+1)) = MinF+(MaxF-MinF)*((rr-1)/(UkPop-1));
end