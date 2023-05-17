# Project PIR - NOMA system
This programme, run on Matlab, is used to simulate the NOMA system where each user transmits only one bit.  
There are three parts including "encoding", "decoding" and "check"  

# Encoding
It generates a transmission signal y = sum(bi * ci) + n, and a codebook for the users where all possible sum of codewords are unequal.  

# Decoding
This part decode the signal received by eliminate the noise and then decode the superposition code to find active users.   

# Check
It is used to check if the signal decoded is same as the signal emitted.   

# Result
It can now generate codewords for 9 users using 6 bits minimum, and realise the encoding and decoding of a simple NOMA system.   
In theory, the algorithm can generate more codewords if we use more bits.   
Here is the codewords generated for 9 users:  
     [1     1     0     1     0     1]  
     [1     0     1     1     1     0]  
     [0     1     0     1     1     0]  
     [0     1     1     1     0     1]  
     [0     1     1     0     0     0]  
     [1     1     0     0     0     1]  
     [1     0     1     1     0     1]  
     [0     1     1     0     1     1]  
     [0     0     1     1     0     1]  

# Comments
The codewords generating algorithm have some problems such as it's hard to reach the maximum bit utilisation, because it generate the code randomly, and it has a very high complexity since it needs to travers the entire list many times to add one code.  
In addition, this system is currently only applicable when all users transmit only one bit. 
