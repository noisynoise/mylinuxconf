#/bin/bash
# super-script trop bi1 de login user !

# on liste tout les modes de cowsay
id=0
for i in $(ls /usr/share/cowsay/cows/)
  do cow_variant=$( echo $i | awk -F "." '{ print $1}')
#  echo $cow_variant 
  cow_array[$id]="$cow_variant"
  id=$(( $id + 1 ))
#  echo $id
done

size=${#cow_array[@]}
index=$(($RANDOM % $size))
rand_id=${cow_array[$index]}

# Exception for beavis which is beavis.zen
if [ "$rand_id" = "beavis" ]
 then 
   rand_id="beavis.zen"
fi

#echo " "
# echo "your random id is $rand_id"

# cowsay -f $rand_id $USER FTW ! |lolcat --force
cowsay -f $rand_id $(fortune) |lolcat 
# fortune | /usr/games/cowsay -f $rand_id | lolcat --force
# fortune | cowsay | /usr/local/bin/lolcat
