1  ls
2  emacs /etc/nginx/sites-enabled/default
3  emacs my.cnf
4  tail /var/log/mysql/error.log
5  cat /etc/passwd
6  ls
7  cd /etc/mysql/
8  ls
9  emacs my.cnf
10  ls -la /var/lib/
11  cd /var/lib/newmysql
12  ls
13  ls -la
14  cd ..
15  ls
16  ls -la
17  cd mysql/
18  ls
19  ls -la
20  cd mysql
21  ls
22  ls -la
23  cd ..
24  ls
25  ls -la
26  cd ..
27  cd newmysql/
28  ls
29  cd mysql
30  ls -la
31  cd ..
32  ls
33  ls -la
34  chown mysql:root mysql
35  ls -la
36  chmod 0660 ibdata1 ib_logfile0 ib_logfile1
37  cd ..
38  ls
39  ls -la
40  cd ..
41  ls
42  mount -o remount,rw /
43  mysql start
44  sudo service mysql start
45  cd /var/log/mysql/error.log
46  cat /var/log/mysql/error.log
47  cd /etc/mysql/
48  ls
49  emacs my.cnf
50  cd /var/lib/
51  ls
52  cd mysql/
53  ls
54  ls -la
55  cd ..
56  cd newmysql/
57  ls
58  ls -la
59  chown mysql:root mysql
60  cd ..
61  ls
62  mount -o remount,rw /
63  chown mysql:root mysql/
64  ls
65  ls -la
66  cd newmysql/
67  mount -o remount,rw /
68  chown mysql:root mysql/
69  mount -o remount,rw /var/lib/newmysql
70  chown mysql:root mysql/
71  ls -la
72  chown root:root mysql_upgrade_info
73  service mysql start
74  service mysql status
75  curl http://localhost:8080
76  curl http://localhost:80
77  curl http://172.31.60.147:80
78  curl http://172.31.60.147:8080
79  service nginx status
80  service nginx start
81  ps aux | less
82  cd /etc/
83  ls
84  cd cron.d
85  ls
86  cat php5
87  cd /etc/cron.daily/
88  ls
89  cd apache2
90  less apache2
91  cd ..
92  ls
93  cd cron.hourly/
94  ls
95  cd ..
96  cat crontab
97  cd cron.hourly/
98  ls
99  cd ..
100  ls
101  ps aux | less
102  cd cron.monthly/
103  ls
104  cd ..
105  less crontab
106  history
