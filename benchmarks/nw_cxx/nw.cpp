#include <stdlib.h>
#include <string.h>

#include "nw.h"

#define NW_DEBUG 1

int  max( int f1, int f2, int f3, char * ptr )
{
        int  max = 0 ;
        if( f1 >= f2 && f1 >= f3 )
        {
                max = f1 ;
                *ptr = '|' ;
        }
        else if( f2 > f3 )
        {
                max = f2 ;
                *ptr = '\\' ;
        }
        else
        {
                max = f3 ;
                *ptr = '-' ;
        }
        return  max ;
}

void  dpm_init( int ** F, char ** traceback, int L1, int L2, int d )
{
        F[ 0 ][ 0 ] =  0 ;
        traceback[ 0 ][ 0 ] = 'n' ;

        int i=0, j=0;

        for( j = 1; j <= L1; j++ )
        {
                F[ 0 ][ j ] =  -j * d ;
                traceback[ 0 ][ j ] =  '-' ;
        }
        for( i = 1; i <= L2; i++ )
        {
                F[ i ][ 0 ] =  -i * d ;
                traceback[ i ][ 0 ] =  '|' ;
        }
}


void  print_matrix( int ** F, char *seq_1, char *seq_2 )
{
        int  L1 = strlen(seq_1);
        int  L2 = strlen(seq_2);
        //PrintDebugInfo("        ");
        for( int j = 0; j < L1; j++ )
        {
                //PrintDebugInfo("%c   ", seq_1[ j ]);
        }
        //PrintDebugInfo("\n");

        for( int i = 0; i <= L2; i++ )
        {
                if( i > 0 )
                {
                        //PrintDebugInfo("%c ", seq_2[ i-1 ]);
                }
                for( int j = 0; j <= L1; j++ )
                {
                        //PrintDebugInfo("%d ", F[ i ][ j ]);
                }
                //PrintDebugInfo("\n");
        }
}

void  print_traceback( char ** traceback, char *seq_1, char *seq_2 )
{
        int  L1 = strlen(seq_1);
        int  L2 = strlen(seq_2);

        //PrintDebugInfo("    ");
        for( int j = 0; j < L1; j++ )
        {
                //PrintDebugInfo("%c ", seq_1[ j ]);
        }
        //PrintDebugInfo("\n");

        for( int i = 0; i <= L2; i++ )
        {
                if( i > 0 )
                {
                        //PrintDebugInfo("%c ", seq_2[ i-1 ]);
                }
                for( int j = 0; j <= L1; j++ )
                {
                        //PrintDebugInfo("%c ", traceback[ i ][ j ]);
                }
                //PrintDebugInfo("\n");
        }
}

/* implemented by Weijie */
char *strrev(char *str)
{
        char *p1, *p2;
        if (! str || ! *str)
                return str;
        for (p1 = str, p2 = str + strlen(str) - 1; p2 > p1; ++p1, --p2)
        {
                *p1 ^= *p2;
                *p2 ^= *p1;
                *p1 ^= *p2;
        }
        return str;
}

int nw_align(                  // Needleman-Wunsch algorithm
              int **     F,
              char **    traceback,
              char *seq_1,
              char *seq_2,
              char *seq_1_al,
              char *seq_2_al,
              int        d         // Gap penalty
            )
{
        int        k = 0, x = 0, y = 0;

        int        fU, fD, fL ;
        char       ptr, nuc ;
        int        i = 0, j = 0;

        const int  a =  2;   // Match
        const int  b = -1;   // Mismatch

        const int  s[ 4 ][ 4 ] = { { a, b, b, b },    /* substitution matrix */
                                   { b, a, b, b },
                                   { b, b, a, b },
                                   { b, b, b, a } } ;

        int  L1 = strlen(seq_1);
        int  L2 = strlen(seq_2);

        /* define by Weijie */
        //char attach[2] = {NULL};
        char attach[2] = "";

        for( i = 1; i <= L2; i++ )
        {
                for( j = 1; j <= L1; j++ )

                {
                        nuc = seq_1[ j-1 ] ;

                        switch( nuc )
                        {
                                case 'A':  x = 0 ;  break ;
                                case 'C':  x = 1 ;  break ;
                                case 'G':  x = 2 ;  break ;
                                case 'T':  x = 3 ;
                        }

                        nuc = seq_2[ i-1 ] ;

                        switch( nuc )
                        {
                                case 'A':  y = 0 ;  break ;
                                case 'C':  y = 1 ;  break ;
                                case 'G':  y = 2 ;  break ;
                                case 'T':  y = 3 ;
                        }

                        fU = F[ i-1 ][ j ] - d ;
                        fD = F[ i-1 ][ j-1 ] + s[ x ][ y ] ;
                        fL = F[ i ][ j-1 ] - d ;

                        F[ i ][ j ] = max( fU, fD, fL, &ptr ) ;
                        traceback[ i ][ j ] =  ptr ;
                }
        }
        i-- ; j-- ;
        while( i > 0 || j > 0 )
        {
                switch( traceback[ i ][ j ] )
                {

                        case '|' :      //seq_1_al += '-' ;
                                        strncat(seq_1_al, "-", 1);
                                        //seq_2_al += seq_2[ i-1 ] ;
                                        attach[0] = seq_2[i-1];
                                        attach[1] = '\0';
                                        strncat(seq_2_al, attach, 1);
                                        i-- ;
                                        break ;

                        case '\\':      //seq_1_al += seq_1[ j-1 ] ;
                                        attach[0] = seq_1[j-1];
                                        attach[1] = '\0';
                                        strncat(seq_1_al, attach, 1);
                                        //seq_2_al += seq_2[ i-1 ] ;
                                        attach[0] = seq_2[i-1];
                                        attach[1] = '\0';
                                        strncat(seq_2_al, attach, 1);
                                        i-- ;  j-- ;
                                        break ;

                        case '-' :      //seq_1_al += seq_1[ j-1 ] ;
                                        attach[0] = seq_1[j-1];



                                        attach[1] = '\0';
                                        strncat(seq_1_al, attach, 1);
                                        //seq_2_al += '-' ;
                                        strncat(seq_2_al, "-", 1);
                                        j-- ;
                }
                k++ ;
        }

        /* reverse seq_als, modified by Weijie. */
        char *tmp1, *tmp2;
        tmp1 = strrev(seq_1_al);
        tmp2 = strrev(seq_2_al);
        return  0 ;
}


/* entry point function nw */
void Ecall_nw(
        char *seq_1,          /*  Needleman-Wunsch   */
        char *seq_2,          /*  algorithm for      */
        char *seq_1_al,       /*  global alignment   */
        char *seq_2_al        /*  of nt sequence.    */
      )
{
        int  d = 2 ;                 /* gap penalty */

        int  L1 = strlen(seq_1);
        int  L2 = strlen(seq_2);

        // Dynamic programming matrix
        int ** F = new int * [ L2+1 ];
        for( int i = 0; i <= L2; i++ )  F[ i ] = new int [ L1 ];
        // Traceback matrix
        char ** traceback = new char * [ L2+1 ];
        for( int i = 0; i <= L2; i++ )  traceback[ i ] = new char [ L1 ];

        // Initialize traceback and F matrix (fill in first row and column)
        dpm_init( F, traceback, L1, L2, d );

        /* Initialize seq_als */
        seq_1_al[0] = '\0';
        seq_2_al[0] = '\0';
        #if NW_DEBUG
            int  L_al = strlen(seq_1_al);
        #endif

        // Create alignment
        nw_align( F, traceback, seq_1, seq_2, seq_1_al, seq_2_al, d );
        print_matrix( F, seq_1, seq_2 );
        print_traceback( traceback, seq_1, seq_2 );
}

int main(void){
	char seq_1[] = "AGTACGTC";
        char seq_2[] = "ACGTCGT";
	char seq_1_al[50];
        char seq_2_al[50];

	Ecall_nw(seq_1, seq_2, seq_1_al, seq_2_al);
	return 0;
}
