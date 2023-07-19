list= "lambda1.dat"
while (fscan (list, x) != EOF) {
    print (x)
    redcorr wave=x flux=100. c_ext=1. red_func="gal"
    y = log10(redcorr.result)-2
    print (x,y, >> "ext_gal.dat")
}
