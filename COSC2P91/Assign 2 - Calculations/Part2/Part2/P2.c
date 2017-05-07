
#include <stdio.h>
#include <stdlib.h>

#define NUM_ROWS 4 //4 values(Ohm/V/A/W)
#define NUM_COLS 5 //5 resistors

//on windows, to exit you have to enter "CTRL+C" to exit
double voltage, current, power, avgPower; //values
int dataSet=1;

double values[NUM_ROWS][NUM_COLS]; //array for the dataset
char row_names[NUM_ROWS][32]={ "Resistance[Ohm]",
                                "Voltage[V]    ",
                                "Current[A]    ", 
                                "Power[W]      " };

/*
 Wheatstone Bridge Data Set # dd:
       Voltage applied:                             dddd.dddd V
       Total current flowing through bridge:        dddd.dddd A
       Total power dissipated in the bridge:        dddd.dddd W
       Percentage of power dissipated by the meter: dddd.dddd %
 */

void get_input( void ){  //gets resistor values
       printf( "Voltage applied:                             \n" ); //dddd.dddd V
       scanf( "%.4lf", &voltage );
       
       printf( "Total current flowing through bridge:        \n" ); //dddd.dddd A
       scanf( "%.4lf", &current );
       
       printf( "Total power dissipated in the bridge:        \n" ); //dddd.dddd W
       scanf( "%.4lf", &power );
       
       printf( "Percentage of power dissipated by the meter: \n" ); //dddd.dddd %
       scanf( "%.4lf", &avgPower );
}

void compute( void ){  //computes dataset table
    int i,j;
    
    for ( i=0; i<NUM_ROWS; i++ )  //determines array size
        for ( j=0; j<NUM_COLS; j++ ){//formula for calculating power/ current
            values[i][j]=i*j; //sets the data values in the table
            
            
            
        }
}

/*
                           R1          R2          R3          R4          R5
       Resistance[Ohm]  dddd.dddd   dddd.dddd   dddd.dddd   dddd.dddd   dddd.dddd
       Voltage[V]       dddd.dddd   dddd.dddd   dddd.dddd   dddd.dddd   dddd.dddd
       Current[A]       dddd.dddd   dddd.dddd   dddd.dddd   dddd.dddd   dddd.dddd
       Power[W]         dddd.dddd   dddd.dddd   dddd.dddd   dddd.dddd   dddd.dddd
 */

void display_results( void ){ //prints results to table
    int i,j;
        printf( "                 R1       R2       R3       R4       R5\n" );
        for ( i=0; i<NUM_ROWS; i++ ){
            printf( "%s", row_names[i] );  //prints the resistor headers
             for ( j=0; j<NUM_COLS; j++ )
                 printf( "%.4lf", values[i][j] ); //prints values to table
            puts("");
        }
        
       puts("");
}

int P2() { 
    //printf("Acquired %d samples. Total %d; Value 0: %.3f\r",read,totalRead+=read, data[0]);
    compute();
    
    while (1){  //while true, print dataset table 
       printf( "Wheatstone Bridge Data Set # %.2d:\n", dataSet ); 
       dataSet++;
       
       get_input();
       display_results(); 
       //CRT + C to exit in windows
    }
    

   return 0;
}



