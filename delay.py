import  traceanalyzer as tr
#end-to-end delay
eedelay0=tr.Eedelay('trace.tr','0')
eedelay1=tr.Eedelay('trace.tr','1')
eedelay2=tr.Eedelay('trace.tr','2')
eedelay3=tr.Eedelay('trace.tr','3')

#Calculate the averages

arr0 = eedelay0.eedelay_array
arr1 = eedelay1.eedelay_array
arr2 = eedelay2.eedelay_array
arr3 = eedelay3.eedelay_array

print("Average end-to-end delay for node 0 is " ,  sum (arr0) / len (arr0))
print("Average end-to-end delay for node 1 is " ,  sum (arr1) / len (arr1))
print("Average end-to-end delay for node 2 is " ,  sum (arr2) / len (arr2))
print("Average end-to-end delay for node 3 is " ,  sum (arr3) / len (arr3))