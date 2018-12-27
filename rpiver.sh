#!/bin/bash

hwinfo()
{
  hwver=$1
  hwitm=$2
  
  sedstr=`\
    cat "$0" \
    | egrep "^### \| Revision \|" \
    | sed "s/^\(.*| \)\(${hwitm} *\)\( |.*\)$/\1\\\\\(\2\\\\\)\3/g" \
    | sed "s/[^\\\#()]/\./g" \
    | sed "s/^\(.*\)$/s\/\^\1\$\/\\\\\1\/g/g"`
#  echo "$sedstr"
#  sedstr="s/^###............................\(.................................\).*$/\1/g"
#  echo "$sedstr"
  cat "$0" \
    | egrep "^### \|  *${hwver}  *\|.*$" \
    | sed "${sedstr}" \
    | sed "s/^  *//g;;s/  *$//g"

}

vstring=`\
  cat /proc/cpuinfo \
  | grep '^Revision.*:' \
  | awk '{print $3}' \
  | sed 's/^1000//'`

#vstring=a020d3

rev=`hwinfo "$vstring" "Revision"`
rel=`hwinfo "$vstring" "Release Date"`
mod=`hwinfo "$vstring" "Model"`
pcb=`hwinfo "$vstring" "PCB Revision"`
mem=`hwinfo "$vstring" "Memory"`
nts=`hwinfo "$vstring" "Notes"`
mfg=`hwinfo "$vstring" "Manufacturer"`

printf "Revision    : %s\n" "${rev}"
printf "Release Date: %s\n" "${rel}"
printf "Model       : %s\n" "${mod}"
printf "PCB Revision: %s\n" "${pcb}"
printf "Memory      : %s\n" "${mem}"
printf "Notes       : %s\n" "${nts}"
printf "Manufacturer: %s\n" "${mfg}"


exit 0

# version information from https://elinux.org/RPi_HardwareHistory
# KEEP THIS TABLE NEAT!!

### +----------+--------------+---------------------------------+--------------+-----------------+---------------------------+--------------+ 
### | Revision | Release Date | Model                           | PCB Revision | Memory          | Notes                     | Manufacturer | 
### +----------+--------------+---------------------------------+--------------+-----------------+---------------------------+--------------+ 
### |   Beta   | Q1 2012      | B (Beta)                        | ?            | 256 MB          | Beta Board                | ?            | 
### |   0002   | Q1 2012      | B                               | 1.0          | 256 MB          |                           | ?            | 
### |   0003   | Q3 2012      | B (ECN0001)                     | 1.0          | 256 MB          | Fuses mod and D14 removed | ?            | 
### |   0004   | Q3 2012      | B                               | 2.0          | 256 MB          |                           | Sony         | 
### |   0005   | Q4 2012      | B                               | 2.0          | 256 MB          |                           | Qisda        | 
### |   0006   | Q4 2012      | B                               | 2.0          | 256 MB          |                           | Egoman       | 
### |   0007   | Q1 2013      | A                               | 2.0          | 256 MB          |                           | Egoman       | 
### |   0008   | Q1 2013      | A                               | 2.0          | 256 MB          |                           | Sony         | 
### |   0009   | Q1 2013      | A                               | 2.0          | 256 MB          |                           | Qisda        | 
### |   000d   | Q4 2012      | B                               | 2.0          | 512 MB          |                           | Egoman       | 
### |   000e   | Q4 2012      | B                               | 2.0          | 512 MB          |                           | Sony         | 
### |   000f   | Q4 2012      | B                               | 2.0          | 512 MB          |                           | Qisda        | 
### |   0010   | Q3 2014      | B+                              | 1.0          | 512 MB          |                           | Sony         | 
### |   0011   | Q2 2014      | Compute Module 1                | 1.0          | 512 MB          |                           | Sony         | 
### |   0012   | Q4 2014      | A+                              | 1.1          | 256 MB          |                           | Sony         | 
### |   0013   | Q1 2015      | B+                              | 1.2          | 512 MB          |                           | Embest       | 
### |   0014   | Q2 2014      | Compute Module 1                | 1.0          | 512 MB          |                           | Embest       | 
### |   0015   | ?            | A+                              | 1.1          | 256 MB / 512 MB |                           | Embest       | 
### | a01040   | Unknown      | 2 Model B                       | 1.0          |   1 GB          |                           | Sony         | 
### | a01041   | Q1 2015      | 2 Model B                       | 1.1          |   1 GB          |                           | Sony         | 
### | a21041   | Q1 2015      | 2 Model B                       | 1.1          |   1 GB          |                           | Embest       | 
### | a22042   | Q3 2016      | 2 Model B (with BCM2837)        | 1.2          |   1 GB          |                           | Embest       | 
### | 900021   | Q3 2016      | A+                              | 1.1          | 512 MB          |                           | Sony         | 
### | 900032   | Q2 2016?     | B+                              | 1.2          | 512 MB          |                           | Sony         | 
### | 900092   | Q4 2015      | Zero                            | 1.2          | 512 MB          |                           | Sony         | 
### | 900093   | Q2 2016      | Zero                            | 1.3          | 512 MB          |                           | Sony         | 
### | 920093   | Q4 2016?     | Zero                            | 1.3          | 512 MB          |                           | Embest       | 
### | 9000c1   | Q1 2017      | Zero W                          | 1.1          | 512 MB          |                           | Sony         | 
### | a02082   | Q1 2016      | 3 Model B                       | 1.2          |   1 GB          |                           | Sony         | 
### | a020a0   | Q1 2017      | Compute Module 3 (and CM3 Lite) | 1.0          |   1 GB          |                           | Sony         | 
### | a22082   | Q1 2016      | 3 Model B                       | 1.2          |   1 GB          |                           | Embest       | 
### | a32082   | Q4 2016      | 3 Model B                       | 1.2          |   1 GB          |                           | Sony Japan   | 
### | a020d3   | Q1 2018      | 3 Model B+                      | 1.3          |   1 GB          |                           | Sony         | 
### | 9020e0   | Q4 2018      | 3 Model A+                      | 1.0          | 512 MB          |                           | Sony         | 
### +----------+--------------+---------------------------------+--------------+-----------------+---------------------------+--------------+ 


