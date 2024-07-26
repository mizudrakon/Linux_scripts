#!/usr/bin/awk -f                                                                                    
#first argument is row size, second is the file to read!
BEGIN {num=ARGV[1]; ARGV[1]=""; w=0; ch=0} #w number of words, ch characters
#special case: empty row. Write out the array and new line
/^$/ { 
    for (j=1; j<=w; j++) {                                                                          
             printf A[j]" "                                                                          
    };                                                                                          
    print "\n";                                           
    # reset counters                                           
    w=0;                                                                                             
    ch=0;                                                                                            
}                                                                                                    
{ 
    for (i=1; i<=NF; i++) {                                                                              
        if (ch + length($i) <= num){    #the word fits and gets added to the array                                                             
            w++;                                                                                     
            A[w]=$i;                                                                                 
            ch += length($i) + 1;       #additional space is counted too for the next round                                                             
        } else {                        #word doesn't fit...                                                             
            ch-=w;                                                                                   
            j=1;                                                                                     
            while (ch<num-1){           #A gets filled with spaces to reach the required row size                                                             
                if (j==w){                                                                           
                    j=1;                                                                             
                }                                                                                    
                A[j] = A[j]" ";                                                                      
                ch++;                                                                                
                j++;                                                                                 
            };                                                                                       
            for (j=1; j<=w; j++){       #print row and endline                                                             
                printf A[j];                                                                         
            }                                                                                        
            printf "\n";                                                                             
            w=1;                        #...the word gets inserted to the beginning of A for the next line                                                             
            ch=length($i)+1;                                                                         
            A[w]=$i;                                                                                 
        }                                                                                            
    }
}                                                                
#special case : end. Print rest.
END {
    for (j=1; j<=w; j++){                                                                           
             printf A[j]" "                                                                          
    };                                                                                          
    printf "\n";                                                                                     
}