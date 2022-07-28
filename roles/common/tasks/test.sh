

#!/bin/bash
filepath=$(cat filepath.txt)

dummy_fcheck()
{
echo -e "\e[32m Pre-defined test files & >60days modified files in $line:\n \e[0m"
find $1 -type f \( -name '*test*' -o -name "*onetime*" -o -name "*dummy*" -o -name "*Test*file*" \) -exec ls -lt {} \; > testfiles.txt
find $1 -mtime +60 -ls > olddated_files.txt
}

highused_files()
{
echo -e "\e[34m Top 5 directory  & usage files & listing <15days created files in $Filesystem_Path:\n \e[0m"
find $1 -type f -exec du -sk {} + | sort -rn | head -5 > dufiles.txt
find $1 -type d -exec du -sk {} + | sort -rn | head -5 > dudir.txt
}

dir_func()
{
echo -e "$1 \n"
}

file_func()
{
echo -e "$1 \n"
}

for dire in $(cat dufiles.txt)
do
files_func "$dire"
done



for fil in $(cat dufiles.txt)
do
dir_func "$fil"
done

for line in $filepath
do
#cd $line
#calling functions
dummy_fcheck "$line"
highused_files "$line"
awk -F ' ' '{print $NF}' dufiles.txt > dufiles.txt
awk -F ' ' '{print $NF}' dufiles.txt > dudir.txt


echo -e "\e[32m *******Succesfully completed***********\n \e[0m"
done
exit 0
