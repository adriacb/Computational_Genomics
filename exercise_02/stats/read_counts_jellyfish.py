import re
import sys
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('filename')
args = parser.parse_args()


with open(args.filename) as file:
    chunk = dict()
    for line in file:

        s = re.match(r"^# (.*) - (.*)",line)
        if s:
            specie = (s.group(1), s.group(2))
            #print (s.group(1), s.group(2),sep='-')
            if specie not in chunk:
                chunk[specie] = [0,0,0,0]
        u = re.match(r"Unique: (.*)",line)
        if u:
           #print(u.group(1))
           chunk[specie][0] = u.group(1)
        d = re.match(r"Distinct: (.*)",line)
        if d:
           #print(d.group(1))
           chunk[specie][1] = d.group(1)
        t = re.match(r"Total: (.*)",line)
        if t:
           #print(t.group(1))
           chunk[specie][2] = t.group(1)
        m = re.match(r"Max_count: (.*)",line)
        if m:

           chunk[specie][3] = m.group(1)

for k in chunk:

    print(k[0],k[1],' '.join(str(x) for x in chunk[k]))
