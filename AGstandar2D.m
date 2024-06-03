
    [MinF, C]=min(objectif_func);
    [MaxF, D]=max(objectif_func);
    BestX=cromosome(C,:);
   bestkrom(gen,:)=BestX;
   BestLoss(gen)=MinF;
   TempPopulasi = cromosome;
   IndeksIndividuTerbaik=C;

   % Elitisme:
   % - Buat satu kopi kromosom terbaik jika ukuran populasi ganjil
   % - Buat dua kopi kromosom terbaik jika ukuran populasi genap
   if mod(popsize,2)==0,           % ukuran populasi genap
      IterasiMulai = 3;            
      TempPopulasi(1,:) = cromosome(IndeksIndividuTerbaik,:);
      TempPopulasi(2,:) = cromosome(IndeksIndividuTerbaik,:);
   else                          % ukuran populasi ganjil
      IterasiMulai = 2;
      TempPopulasi(1,:) = cromosome(IndeksIndividuTerbaik,:);
   end
       
   LinearFitness = LinearFitnessRanking(popsize,objectif_func,MaxF,MinF);

   % Roulette-wheel selection dan pindah silang
   for jj=IterasiMulai:2:popsize,
       IP1 = RouletteWheel(popsize,LinearFitness);
       IP2 = RouletteWheel(popsize,LinearFitness);
       if (rand < Prob_Pindah_Silang),
          Anak = PindahSilang(cromosome(IP1,:),cromosome(IP2,:),Panjang_kromosom);
          TempPopulasi(jj,:) = Anak(1,:);
          TempPopulasi(jj+1,:) = Anak(2,:);
        else
          TempPopulasi(jj,:) = cromosome(IP1,:);
          TempPopulasi(jj+1,:) = cromosome(IP2,:);
        end    
   end
   clear LinearFitness Anak
   % Mutasi dilakukan pada semua kromosom
   for i=IterasiMulai:popsize,
       for j=1:Panjang_kromosom,
           mut=rand();
          if (mut < mutation_probability)
              %TempPopulasi(i,j)=TempPopulasi(i,j)*0.01;
           if TempPopulasi(i,j)==1
               TempPopulasi(i,j)=0;
            elseif TempPopulasi(i,j)==0
               TempPopulasi(i,j)=1;
           end
           clear mut
          end
          
       end
     
   end    

   % Generational Replacement: mengganti semua kromosom sekaligus
   cromosome = TempPopulasi;
      