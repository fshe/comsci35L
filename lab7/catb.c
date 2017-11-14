#include <stdio.h>

int main(){
	for(;;){
		int c = getchar();
		if( c == EOF )
			break;
		putchar(c);
	}
}
