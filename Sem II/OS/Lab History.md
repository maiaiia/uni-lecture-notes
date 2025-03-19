Lab 1
```
21  chmod +x a.txt

   22  ls -l

   23  man ls

   24  la -a

   25  ls -a

   26  ls -l -a

   27  cd mydirectory/

   28  ls

   29  pwd

   30  ls ..

   31  cd ..

   32  ls

   33  man pwd

   34  echo Hello

   35  echo $HOME

   36  echo ~

   37  man cp

   38  cp a.txt

   39  ls

   40  cp a.txt copie.txt

   41  l

   42  ls

   43  rm copie.txt 

   44  cd mydirectory/

   45  touch a.txt

   46  cd a.txt copie.txt

   47  cp a.txt copie.txt

   48  ls

   49  mv copie.txt ..

   50  ls

   51  ls ..

   52  cd ..

   53  ls

   54  mv copie.txt new.txt

   55  las

   56  ls

   57  man rm

   58  rm new.txt 

   59  ls

   60  rmdir mydirectory/

   61  rm -r mydirectory/

   62  ls

   63  who

   64  history

   65  last

   66  last | grep "andrei"

   67  last | grep "pts/2"

   68  last | grep "Tue"

   69  last 

   70  last | grep "Tue" | sort

   71  man sort

   72  ps

   73  ls

   74  sort

   75  ps

   76  kill -9 14851

   77  kill -9 14951

   78  ps

   79  man ps

   80  ps -ef

   81  ps -ef | head -10

   82  ps -ef | head -20

   83  pstree

   84  top

   85  q

   86  cal

   87  date

   88  last

   89  last > 26feblogs.txt

   90  cat 26feblogs.txt 

   91  ls

   92  mkdir dir1 

   93  cd dir1/

   94  touch a.txt

   95  cd ..

   96  rm dir1

   97  rm dir1 2> error.txt

   98  ls

   99  cat error.txt 

  100  rm dir1 2>> error.txt

  101  cat error.txt 

  102  rm dir1 2> error.txt

  103  cat error.txt 

  104  vim hw.c

  105  cat hw.c 

  106  vim hw.c

  107  gcc -Wall -o hw.out hw.c

  108  ls

  109  ./hw.out

  110  vim hw.c

  111  man gcc

  112  man vim

  113  ./hw.out | echo > output.txt

  114  ls

  115  cat output.txt 

  116  ./hw.out | cat > output.txt 

  117  cat output.txt 

  118  ./hw.out | cat >> output.txt 

  119  cat output.txt 

  120  history
```

Lab 4
```
    1  ls

    2  cat /etc/passwd | grep -E -i "\<[a-z]{10, }\>"

    3  cat /etc/passwd

    4  cat /etc/passwd | sed -E "y/oaesb/04358/"

    5  cat /etc/passwd | sed -E "s/[aeiou]{3}/(&)/g"

    6  cat /etc/passwd | sed -E "s/[aeiouAEIOU]{3}/(&)/g"

    7  cat /etc/passwd | sed -E "s/[aeiouAEIOU]{3,}/(&)/g"

    8  cat /etc/passwd | sed -E "s/([aeiouAEIOU]{3,})/(\1)/g"

    9  cat /etc/passwd | sed -E "s/([aeiouAEIOU])([aeiouAEIOU])([aeiouAEIOU])/(\3\2\1)/g"

   10  man sed

   11  cat /etc/passwd

   12  cat /etc/passwd | grep -E "211"

   13  cat /etc/passwd | grep -E "211" | awk -F: '{print $5}'

   14  cat /etc/passwd | grep -E "211" | awk -F: '{print $5}' | awk -F- '{$3}'

   15  cat /etc/passwd | grep -E "211" | awk -F: '{print $5}' | awk -F- '{print $3}'

   16  cat /etc/passwd | grep -E "211" | awk -F: '{print $5}' | awk -F- '{print $3 $4}'

   17  cat /etc/passwd | grep -E "211" | awk -F: '{print $5}' | awk -F- '{print $3}" | awk '$NF ~ /A$/ {print $0}'

   18  cat /etc/passwd | grep -E "211" | awk -F: '{print $5}' | awk -F- '{print $3}" | awk ' $NF ~ /A$/ {print $0}'

   19  cat /etc/passwd | grep -E "211" | awk -F: '{print $5}' | awk -F- '{print $3}" | awk ' $NF ~ /A$/ {print $0}'

   20  cat /etc/passwd | grep -E "211" | awk -F: '{print $5}' | awk -F- '{print $3 $4}'

   21  cat /etc/passwd | grep -E "211" | awk -F: '{print $5}' | awk -F- '{print $3}" | awk ' $NF ~ /A$/ {print $1}'

   22  last

   23  last | awk ' $NF /[0-9]{2}\)$/ {print $1, $NF}'

   24  exec bash

   25  last | awk ' $NF /[0-9]{2}\)$/ {print $1, $NF}'

   26  last | awk ' $NF ~ /[0-9]{2}\)$/ {print $1, $NF}'

   27  cat /etc/passwd

   28  ps

   29  man ps

   30  ps =e

   31  ps -e

   32  ps -ef

   33  man ps

   34  ps -eF

   35  ps -ef

   36  ps -ef | grep root

   37  ps -ef | awk '{print $1}'

   38  ps -ef | sort |  awk '{print $1}' 

   39  ps -ef | sort | uniq |  awk '{print $1}' 

   40  ps -ef | sort |  awk '{print $1}' | uniq

   41  ps -ef |  awk '{print $1}' | sort | uniw

   42  ps -ef |  awk '{print $1}' | sort | uniq

   43  ps -ef |  awk '{print $1}' | sort | uniq -c

   44  ps -ef |  awk '{print $1}' | sort | uniq -c | sort -n

   45  ps -ef |  awk '{print $1}' | sort | uniq -c | sort -n -r

   46  ps -ef |  awk '{print $1}' | sort | uniq -c | sort -r

   47  ps -ef |  awk '{print $1}' | sort | uniq -c | sort -n -r

   48  ps -ef |  awk '{print $1}' | sort | uniq -c | sort -nr

   49  ps -ef |  awk '{print $1}' | sort | uniq -c | sort -nr | head -5

   50  ps -ef |  awk '{print $1}' | sort | uniq -c | sort -nr | tail -5

   51  ps -ef |  awk '{print $1}' | sort | uniq -c | sort -nr | head -5

   52  ps -ef

   53  ps -ef |  awk '{print $1}' | grep -E "yz906"

   54  ps -ef |  awk '{print $1}' | grep -E "yz906" | uniq -c

   55  history
```