#Renames files according to the filter. The filter name is put directly 
#before the ".imh" extension. Filters 2,3,4,5 are b,v,r,i, respectively. 
#Other header fields edited:gain,rdnoise,ra,dec,obsvat,objecttype,julian date
#Written by Gaspar A. Bakos (bakos@cs.elte.hu)

files *.fits > datalist
list = "datalist"

	while (fscan(list,s1)!=EOF)
	{
		imgets(s1,"FILTER")		
		if(imgets.value=='2'){
			s3='b'	
			hedit(s1,"filters",s3,add=yes,delete=no,verify=no,show=yes,update=yes)
		}
		else if(imgets.value=='3'){
			s3='v'
            hedit(s1,"filters",s3,add=yes,delete=no,verify=no,show=yes,update=yes)
        }
		else if(imgets.value=='4'){
			s3='r'
            hedit(s1,"filters",s3,add=yes,delete=no,verify=no,show=yes,update=yes)
        }
		else if(imgets.value=='5'){
			s3='i'
            hedit(s1,"filters",s3,add=yes,delete=no,verify=no,show=yes,update=yes)
        }

		i=stridx(".",s1)
#		print(i)
		s2=substr(s1,1,i-1) // s3 // ".imh"
		print(s1, "	", s2)
		imrename(s1,s2,verbose=yes)
	}
	delete("datalist")

hedit ("*.imh",
"GAIN", "2.5", add=yes, delete=no, verify=no, show=yes, update=yes)

hedit ("*.imh",
"RDNOISE", "0.43", add=yes, delete=no, verify=no, show=yes, update=yes)

hedit ("*.imh",
"OBSVAT", "piszkes", add=yes, delete=no, verify=no, show=yes, update=yes)

#hedit ("*m3*.imh",
#"DEC", "28:22:32.0", add=yes, delete=no, verify=no, show=yes, update=yes)
#
#hedit ("*m3*.imh",
#"RA", "13:42:11.2", add=yes, delete=no, verify=no, show=yes, update=yes)

#imred package should be loaded!
ccdhedit ("*.imh",
"IMAGETYPE", "object", type="string")

ccdhedit ("*b.imh",
"subset", "b", type="string")

ccdhedit ("*v.imh",
"subset", "v", type="string")

ccdhedit ("*i.imh",
"subset", "i", type="string")

ccdhedit ("*bias*.imh",
"IMAGETYPE", "zero", type="string")

ccdhedit ("*dark*.imh",
"IMAGETYPE", "dark", type="string")

ccdhedit ("*flat*.imh",
"IMAGETYPE", "flat", type="string")

#setjd ("*.imh",
#observatory="piszkes", date="date-obs", time="time-beg", exposure="exptime",
#ra="ra", dec="dec", epoch=" ", jd="jd", hjd="hjd", ljd=" ", utdate=no,
#uttime=no, listonly=no)
