#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>


#define BUF_SIZE 10000
#define NUM_LINES 100

#define STDOUT 1
#define STDIN 0


int rot13cmp(void const *, void const *);
int _c_rot13_cmp(char const, char const);

int num_comparisons = 0;

int main(void){
    struct stat *stats = malloc(sizeof(struct stat));

    char* buffer;
    size_t bsize, index=0;

    char ** lines;
    int cline=0, nlines;
    
    fstat(STDIN, stats);

    if( S_ISREG(stats->st_mode) )
        bsize = stats->st_size + 1;
    else
        bsize = BUF_SIZE;
    buffer = (char*) malloc(bsize);            

    if(!buffer){
        fprintf(stderr, "ERROR: malloc failed to allocate space for the buffer");
        return 1;
    }

    //read characters from stdin and place them in buffer
    char c;
    for(;;){
        if(index == bsize){
            bsize += BUF_SIZE;
            buffer = (char*) realloc(buffer, bsize);

            if(!buffer){
                fprintf(stderr, "ERROR: realloc failed to allocate more space for the buffer");
                return 1;
            }
        }

        if( read(STDIN, &c, 1) <= 0 )
            break;
        else
            buffer[index] = c;            


        index++;
    }


    //insert a newline at the end of the buffer if it doesnt end in a newline.
    if(buffer[index-1] != '\n'){
        if(index == bsize){
            bsize++;
            buffer = (char*) realloc(buffer, bsize);

            if(!buffer){
                fprintf(stderr, "ERROR: realloc failed to allocate more space for the buffer");
                return 1;
            }
        }
        buffer[index] = '\n';
    }
    

    //create an array 'lines' which contains pointers to the beginning of each line.
    lines = (char**) malloc(NUM_LINES*sizeof(char*));
    nlines = NUM_LINES, cline = 1;

    lines[0] = buffer;

    char* cbuf;
    for(cbuf = buffer; cbuf != (buffer + index -1); cbuf++){
        if( *cbuf == '\n' ){//insert cbuf+1 at the end of lines.            
            if(cline == nlines){
                nlines += NUM_LINES;
                lines = (char**) realloc(lines, nlines*sizeof(char*));

                if(!lines){
                    fprintf(stderr, "ERROR: realloc failed to allocate more space for line pointers");
                    return 1;
                }
            }

            lines[cline] = cbuf+1;
            cline++;
        }
    }

    qsort( lines, cline, sizeof(char*), rot13cmp );

    int i,j;
    for(i=0; i < cline; i++){
        for(j=0;;j++){
            char c = lines[i][j];
            write(STDOUT, &c, 1);

            if( c == '\n' )
                break;
        }
    }

    free(lines);
    free(buffer);

    fprintf(stderr, "Number of comparisons: %d\n", num_comparisons);
    
    return 0;
}

int rot13cmp(void const *x, void const *y){
    const char *a= *((const char**) x), *b = *((const char**) y);
    int v = 0;

    num_comparisons++;

    int i = 0;
    while( v == 0 ){
        if( a[i] == '\n' ){
            v = -(!(a[i]==b[i])); //-1 if b continues and a doesn't. 
            break;
        }

        if( b[i] == '\n' ){
            v = !(a[i]==b[i]); //1 if b stops and a doesn't. 0 if otherwise.
            break;
        }
      
        v = _c_rot13_cmp(a[i], b[i]);
        i++;
    }

    return v;
}

int _c_rot13_cmp(char const a, char const b){
    int v = a-b;
  
    if( ( a>='a' && a<='z' ) &&
        ( b>='a' && b<='z' ) ){
        v *= ((a<='m' && b<='m') || (a>='n' && b>='n')) ? 1 : -1; 
    }

    if( ( a>='A' && a<='Z' ) &&
        ( b>='A' && b<='Z' ) ){
        v *= ((a<='M' && b<='M') || (a>='N' && b>='N')) ? 1 : -1;
    }

    return v;
}
