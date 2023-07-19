{ a[NR] = $0
  asort(a,b)
}
END {
   for (i=1; i<=NR; i++)
      print b[i]
    }
