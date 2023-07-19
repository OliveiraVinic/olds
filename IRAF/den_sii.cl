int x1, x2, x3
bool b
#
real t
t = 10000.0
s1 = "rsii"
#
list= s1//".dat"
#
while (fscan (list, i, x, y) != EOF) {
    print (x)
    temden density (x) atom=sulfur spectrum=2 assume=t 
    x1 = temden.result
    print (x,y)
    temden density (x+y) atom=sulfur spectrum=2 assume=t 
    if (temden.result == INDEF ) temden.result=0.0
    x2 = temden.result - x1
    print (x,y)
    temden density (x-y) atom=sulfur spectrum=2 assume=t 
    if (x1 == INDEF ) x3 = temden.result
    else x3 = temden.result - x1
    print (i, x, y, x1, x2, x3, >> s1//".den")
}

