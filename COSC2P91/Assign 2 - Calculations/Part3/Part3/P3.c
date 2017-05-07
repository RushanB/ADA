
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <math.h>

#define EPSILON 0.001  //epsilon is global

int P3() {
    
    double x;
    double a;
    double upper_limit;
    printf( "Input constant a:");
    scanf( "%lf", &a );
    //a=0.1;
    
    upper_limit=fabs( 1.0 / a ); // no need to check values of x bigger than this limit
    //upper_limit=0.1;
    
    for ( x=0.0; x<upper_limit; x+=EPSILON ){  //highest point is 1
        double left=sin( x );
        double right=a*x;
        
       // printf( "left=%lf, right=%lf\n", left, right );
        
        if ( fabs(left-right)<EPSILON ){
            printf( "root at x =  %.3lf, value = %.3lf\n", x, left ); //prints roots and values
            printf( "root at x = %.3lf, value = %.3lf\n", -x, left ); // by symmetry it is negative
            //printf( "left=%lf, right=%lf\n", left, right );
        }
    }
    
   return 0;
}
    

