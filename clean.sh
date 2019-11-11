#!/bin/bash
find /home/papa/john-baez-challenge/ -name "*.o"  -print0 | xargs -r -0 /bin/rm
find /home/papa/john-baez-challenge/ -name "*.hi" -print0 | xargs -r -0 /bin/rm
find /home/papa/john-baez-challenge/ -name "*~"   -print0 | xargs -r -0 /bin/rm
/bin/rm /home/papa/john-baez-challenge/test/Main
