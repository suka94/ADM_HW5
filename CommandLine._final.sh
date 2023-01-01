echo 'Question 1'
echo ' '
echo 'The most popular pair of heroes appeearing togheter in the comics is:'
echo ' '
#use the hero-network file to count the occurrences of the heroes' couples, sort  them in descending order and retrieve the first row

sort hero-network.csv | uniq -c | sort -nr | awk -F, 'FNR==2 {print $0}' 

#actually  print row 2 since the first contained the occurences of one hero with himself

echo ' '
echo 'Question 2'
echo ' '
echo 'The number of comics per hero is:'
echo ' '
#use edges file and count the heroes' occurrences and return them in alphabetical order

cut -d, -f1 edges.csv | sort | uniq -c | sort -k2 | head -10

echo ' '
echo 'Question 3'
echo ' '
echo 'The average number of heroes in comics is:'
echo ' '

#count the occurrences of each comic and divide by the total number of comics to compute the average

cut -d, -f2 edges.csv | sort | uniq -c | awk '{s+=$1}END{printf("%0.f\n", s/NR);}'

