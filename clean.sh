#!/bin/bash
find ../john-baez-challenge/ -name "*.o"  -print0 | xargs -r -0 /bin/rm
find ../john-baez-challenge/ -name "*.hi" -print0 | xargs -r -0 /bin/rm
find ../john-baez-challenge/ -name "*~"   -print0 | xargs -r -0 /bin/rm
# remove the executable
/bin/rm -f ../john-baez-challenge/test/Main
