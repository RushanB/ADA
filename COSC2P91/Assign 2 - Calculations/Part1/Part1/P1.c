
#include <stdio.h>
#include <stdlib.h>

int P1(){
    int count, n;
    int a=0, b=1, display=0;
    
    printf("Enter the Nth Value: ");  //takes in n
    scanf("%d",&n);
    printf("Fibonacci Sequence:\n{%d, %d, ", a, b);  //prints out the sequence
    count=2;
    
    while ( count < n ){
        display = a + b;
        a = b;
        b = display;
        ++ count;
        printf("%d, ", display);  //increments the sequence
        
        if(display > 1000000000){
            printf("\nError, Cannot compute too big"); //if negative, prints error
            break;
        }
        
        if(count%10==0)  //puts new line after 10 values
            printf("\n");

    }
    
    puts("}");  
    return 0;
}







