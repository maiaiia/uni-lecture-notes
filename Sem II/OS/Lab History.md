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