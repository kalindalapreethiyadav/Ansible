

#!/bin/bash
filepath=$(cat filepath.txt)
filelist=$(cat files_list.txt)
Dirlist=$(cat dir_list.txt)

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

files_func()
{
echo -e "$1 \n"
}

for line in $filepath
do
#cd $line
#calling functions
dummy_fcheck "$line"
highused_files "$line"
awk -F ' ' '{print $NF}' dufiles.txt > files_list.txt
awk -F ' ' '{print $NF}' dudir.txt > dir_list.txt

for i in $filelist do
dir_func "$i"
done

for j in $Dirlist do
files_func "$j"
done

done
echo -e "\e[32m *******Succesfully completed***********\n \e[0m"
exit 0


cd $1
fsize=$( stat -c %s $1)
find . fsize > 200GB -ctime -15 -ls && return $TRUE || return $FALSE
# return $TRUE (0) if file found 
# return $FALSE (1) if file not found

[ -f "$1" ] && return $TRUE || return $FALSE
}
if [ $? -eq 0 ]
then
	echo "$file added to backup task"
else
	echo "$file not found."
fi
cd $1
