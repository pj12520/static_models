#Gnuplot script to plot regime diagram for floating and sinking regimes as determined from the modified static model

   set terminal epslatex

   set key top right
   
   set xlabel '$\Bo$'
   set ylabel '$D$'

   set xrange[0:10]
   set yrange[0:16]

   set output 'Delta_trans_pub.eps'

   set key title '$\Delta$

   plot '../../static_models/trunk/static_film/Delta=1.dat' u 1:2 w l title '$1$',\
        '../../static_models/trunk/static_film/Delta=1.21.dat' u 1:2 w l title '$1.21$',\
        '../../static_models/trunk/static_film/Delta=1.44.dat' u 1:2 w l title '$1.44$',\
        '../../static_models/trunk/static_film/Delta=1.69.dat' u 1:2 w l title '$1.69$',\
        '../../static_models/trunk/static_film/Delta=1.96.dat' u 1:2 w l title '$1.96$',\
        '../../static_models/trunk/static_film/Delta=2.25.dat' u 1:2 w l title '$2.25$'
   