/*--------------------------------------------
 *
 * main.cpp for nw program.
 *
 *   Implements the Needleman-Wunsch algorithm
 *   for global nucleotide sequence alignment.
 *
 *   Rolf Muertter,  rolf@dslextreme.com
 *   9/5/2006
 *
 ---------------------------------------------*/
 
 
#include "nw.h"
 
using namespace std;
 
int main( int argc, char ** argv )
{
        char *  program = *argv ;
        bool    prm = false;
 
 
        if( argc < 3 )
        {
                cerr << "\n   Usage:   " << program << " seq_1 seq_2 [-p]\n";
                cerr << "\n   -p:       Print matrices\n";
                cerr << "\n   Output:   alignment\n\n";
 
                exit( 1 ) ;
        }                       
        
        // Sequences to be aligned
        string  seq_1   =  argv[ 1 ] ;
        string  seq_2   =  argv[ 2 ] ;
 
        if( argc == 4 )
        {
                string  pr_arg  =  argv[ 3 ] ;
                if( pr_arg == "-p" )  prm = true;   // Print matrices
        }                       
 
        #if DEBUG
            cout << "seq_1: " << seq_1 << endl;
            cout << "seq_2: " << seq_2 << endl;
            cout << "-p: " << prm << endl;
        #endif
 
        // Aligned sequences
        string  seq_1_al;
        string  seq_2_al;
 
        // Get alignment
        nw( seq_1, seq_2, seq_1_al, seq_2_al, prm ) ;   
 
        // Print alignment
        //print_al( seq_1_al, seq_2_al ) ;        

	cout << seq_1_al << endl;
	cout << seq_2_al << endl;

        return  0 ;
}
