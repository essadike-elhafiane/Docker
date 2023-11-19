#include <unistd.h>
#include <stdio.h>
#include <string.h>

int main(){
    int m = 256;
    memset((char *) &m + 1, 5, 1);
    memset(&m, 57, 1);
    printf("%d\n", m);
}