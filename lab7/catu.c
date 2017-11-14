#define STDOUT 1
#define STDIN 0

int main(){
	for(;;){
		int c;
		if( read(STDIN, &c, 1) <= 0)
			break;
		write(STDOUT, &c, 1);
	}
}
