#!/bin/bash -f
num1=`cat coor.txt | awk '{printf "%.3f\n",$1}'`
num2=`cat coor.txt | awk '{printf "%.3f\n",$2}'`
num3=`cat coor.txt | awk '{printf "%.3f\n",$3}'`
k=`grep 'cellOrigin' heating_modif.conf`
sed -n '/cellOrigin/!p' heating_modif.conf > heating.conf 
echo 'cellOrigin          '$num1 $num2 $num3 >> heating.conf
echo 'wrapWater           on'  >> heating.conf
echo 'wrapAll             on' >> heating.conf

sed -n '/cellOrigin/!p' equil.conf > equilibration.conf 
echo 'cellOrigin          '$num1 $num2 $num3 >> equilibration.conf
echo 'wrapWater           on'  >> equilibration.conf
echo 'wrapAll             on' >> equilibration.conf

sed -n '/cellOrigin/!p' md1.conf > md.conf 
echo 'cellOrigin          '$num1 $num2 $num3 >> md.conf
echo 'wrapWater           on'  >> md.conf
echo 'wrapAll             on' >> md.conf

c1=`awk '{print substr($1,2)}' coor_min_max.txt | awk '{printf "%.3f\n",$1}'`
c2=`cat coor_min_max.txt | awk '{printf "%.3f\n",$2}'`
c3=`cat coor_min_max.txt | awk '{printf "%.3f\n",$3}'`
c4=`awk '{print substr($4,2)}' coor_min_max.txt | awk '{printf "%.3f\n",$1}'`
c5=`cat coor_min_max.txt | awk '{printf "%.3f\n",$5}'`
c6=`cat coor_min_max.txt | awk '{printf "%.3f\n",$6}'`
echo "$c4 - $c1" | bc -l  
echo "$c5 - $c2" | bc -l   
echo "$c6 - $c3" | bc -l