#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define NUMLINES 100
#define LINE_LEN 1024

int rot13cmp(void const *, void const *);
int _c_rot13_cmp(char const, char const);

int main(void){
    char **lines = (char**) malloc(NUMLINES*sizeof(char*));
    size_t n_lines = 0, c_lines = NUMLINES;
    bool eof = false;

    if(!lines){
        fprintf(stderr, "ERROR: malloc failed to allocate space for lines");
        return 1;
    }
        
    do{
        if(n_lines == c_lines){
            c_lines += NUMLINES;
            lines = (char**) realloc(lines, c_lines*sizeof(char*));

            if(!lines){
                fprintf(stderr, "ERROR: realloc failed to allocate more space for lines");
                return 1;
            }
        }

        char* line = (char*) malloc(LINE_LEN*sizeof(char));
        int i=0, cap = LINE_LEN, c;

        if(!line){
            fprintf(stderr, "ERROR: malloc failed to allocate space for the current line");
            return 1;
        }

        while( i < LINE_LEN-1 ){
            if( i == cap ){
                cap += LINE_LEN;
                line = (char*) realloc(line, cap*sizeof(char));

                if(!line){
                    fprintf(stderr, "ERROR: realloc failed to allocate more space for the current line");
                    return 1;
                }
            }
            
            c = fgetc(stdin);

            if( c == '\n' )
                break;
            if( c == EOF ){
                eof = true;
                break;
            }

            line[i] = c;
            i++;
        }

        if( i == cap ){
            cap ++;
            line = (char*) realloc(line, cap*sizeof(char));
        }

        if(!line){
            fprintf(stderr, "ERROR: realloc failed to allocate more space for the current line");
            return 1;
        }


        
        line[i] = '\n';
        lines[n_lines] = line;
        n_lines++;
    } while(!eof);

    qsort( lines, n_lines, sizeof(char*), rot13cmp );

    int i;
    for(i=0; i<n_lines; i++){
        int j=0;
        while( j < LINE_LEN ){
            char c = lines[i][j];
            int err = putc(c, stdout);

            if(err == EOF){
                fprintf(stderr, "ERROR: write error");
                return 1;
            }
            

            if( c == '\n' )
                break;
            j++;
        }
    }

    for(i=0; i<n_lines; i++){
        free(lines[i]);
    }
    free(lines);
    
    return 0;
}

int rot13cmp(void const *x, void const *y){
    const char *a= *((const char**) x), *b = *((const char**) y);
    int v = 0;

    int i = 0;
    while( v == 0 ){
        if( a[i] == '\n' ){
            v = -(!(a[i]==b[i])); //-1 if b continues and a doesn't. 
            continue;
        }

        if( b[i] == '\n' ){
            v = !(a[i]==b[i]); //1 if b stops and a doesn't. 0 if otherwise.
            continue;
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
