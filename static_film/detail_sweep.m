function detail_sweep()
%detail_sweep Same as param_sweep but a more detailed sweep over Delta
%between ratio = 0.1 and 0.2

%Number of different Bond numbers and Delta parameters over which to sweep
n_Bond = 26;
n_Delta = 3;

%Choose values of Bond numbers and Delta parameters
for i = 1:10
   Bond(i) = i * 0.2; 
end

for i = 11:26
   Bond(i) = Bond(i - 1) + 0.5; 
end

for i = 1:4
   ratio = 0.14 + i * 0.005;
   
   Delta(i) = (1.0 + ratio) * (1.0 + ratio); 
end

%Find maximum mdr for each pair of Bond number and delta parameter
for i = 1:n_Bond
   for j = 1:n_Delta
       MDR(i,j) = Max_MDR(Bond(i), Delta(j));
       j
   end
   i
end

%Output data
for j = 1:n_Delta
    outfile = strcat('detailed/Delta=',num2str(Delta(j)),'.dat');
    fout = fopen(outfile, 'w');
    fprintf(fout, '%s\t %s\n', '#Bond', 'MDR');
    
    for i = 1:n_Bond
        fprintf(fout, '%f\t %f\n', Bond(i), MDR(i,j));
    end
end
fclose(fout);



end

