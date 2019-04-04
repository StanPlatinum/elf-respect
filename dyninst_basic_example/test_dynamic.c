#include <stdio.h>
#include <unistd.h>

void old(){
    printf("old old old pid is %d\n",getpid());
}
 
void new(){
    printf("new new new pid is %d\n",getpid());
}
 
int main(){
    while(1){
        old() ;
        sleep(5) ;
    }
}
