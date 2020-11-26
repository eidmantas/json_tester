for input in $(ls); do
echo $input
while IFS= read -r line
do
   echo "$line" > tmp.txt
   python -mjson.tool  tmp.txt > /dev/null 
   (($? != 0)) && { printf '%s\n' "Command exited with non-zero"; exit 1; }
done < "$input"
done
