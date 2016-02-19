function param_sweep()
%param_sweep Sweep over different values of the Bond number and Delta
%parameter to identify the sinking floating transition in the Bo, D and
%Delta parameter space.

%Number of different Bond numbers and Delta parameters over which to sweep
n_Bond = 26;
n_Delta = 6;

%Choose values of Bond numbers and Delta parameters
for i = 1:10
   Bond(i) = i * 0.2; 
end

for i = 11:26
   Bond(i) = Bond(i - 1) + 0.5; 
end

for i = 1:6
   ratio = (i - 1) * 0.1;
   
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
    outfile = strcat('Delta=',num2str(Delta(j)),'.dat');
    fout = fopen(outfile, 'w');
    fprintf(fout, '%s\t %s\n', '#Bond', 'MDR');
    
    for i = 1:n_Bond
        fprintf(fout, '%f\t %f\n', Bond(i), MDR(i,j));
    end
end
fclose(fout);

 
end

