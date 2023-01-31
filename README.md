# ASSIGNMENT 1

Implement the given topology using ns2-nam suite. The topology is given below:

![TOPOLOGY JPEG](https://github.com/Kaushikdey647/cn-assignment1/blob/master/assets/top.jpg?raw=true)

**Name: Kaushik Dey**

**Roll No: 20CS01043**

**Date: 31/01/2023**

## 2. Simulation

The simulation is done using the following commands:

```bash
ns script.tcl
nam out.nam
```

## 3. NAM

The NAM output is given below:

![NAM Output](https://github.com/Kaushikdey647/cn-assignment1/blob/master/assets/screenshot.jpg?raw=true)

## Average end to end delay

The average end to end delay is calculated using the following python script:

```python
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
```

| Node | Average End to End Delay |
| :---| :--- |
| A | 0.000000 |
| B | 0.0008997541436687957 |
| C | 0.000000 |
| D | 0.0008995202088758469 |

## 4. Conclusion

The simulation is done successfully. The packets are successfully transferred from source to destination.

## 5. References

1. [SLOGIX: FTP in NS2](https://slogix.in/source-code/ns2-sample-for-wired-networks/how-to-create-data-transfer-between-nodes-using-tcp-in-ns2/)

2. [GFG: Create FTP traffic over TCP](https://www.geeksforgeeks.org/tcl-script-to-create-ftp-traffic-over-tcp/)

3. [SLOGIX: End to End delay using AWK Script](https://slogix.in/source-code/ns2-sample-for-wireless-networks/how-to-calculate-end-to-end-delay-using-awk-script-in-ns2/#:~:text=Delay%20is%20the%20difference%20between,file%20and%20produces%20the%20result.)