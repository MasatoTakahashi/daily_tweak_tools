skip_sync=1
jobname="sample_template"

source_rootdir1="/Volumes/TOSHIBA 6TB MN05ACA600 20210101 installed"
target_rootdir1="/Volumes/TOSHIBA DT02ABA600 20200416installed 1/"

subdirnames=("iTunes" "Movies")

logfilename=./$jobname.log
str_div="#########################################################################################"

#########################################################################################
echo $jobname > $logfilename


#########################################################################################
for subdirname in $subdirnames; do
echo "$str_div" >> $logfilename
echo $subdirname >> $logfilename

source_dir=$source_rootdir1/$subdirname

if [[ ! -d $source_dir ]]; then
    echo "source directory not found: $source_dir" >> $logfilename
    echo "following process will be skipped" >> $logfilename
    continue
fi

if [[ $skip_sync -eq 0 ]]
then
    echo "sync $subdirname" >> $logfilename
    rsync "$source_dir" "$target_rootdir1" -r -v -h --size-only --progress
else
    echo "skip sync $subdirname" >> $logfilename
fi


echo "" >> $logfilename
echo "check sync results" >> $logfilename

chk_target=$source_rootdir1/$subdirname/
echo $chk_target >> $logfilename

echo "file count(source)::" >> $logfilename
find "$chk_target" -type f | wc -l >> $logfilename

echo "directory size(source)::" >> $logfilename
du -d 0 -h "$chk_target" >> $logfilename
du -d 0 "$chk_target" >> $logfilename

echo "" >> $logfilename

chk_target=$target_rootdir1$subdirname/
echo $chk_target >> $logfilename

echo "file count(target)::" >> $logfilename
find "$chk_target" -type f | wc -l >> $logfilename

echo "directory size(target)::" >> $logfilename
du -d 0 -h "$chk_target" >> $logfilename
du -d 0 "$chk_target" >> $logfilename

done
echo "$str_div" >> $logfilename
