/*
* cbuff.h
*/

#include <cbuff.h>
#include <ts7200.h>

#define add1(ind) ((ind) = ((ind) + 1) % CBUFF_SIZE)
#define c_ buff->contents
#define b_ buff->begin
#define e_ buff->end

typedef char *va_list;

#define __va_argsiz(t)	\
(((sizeof(t) + sizeof(int) - 1) / sizeof(int)) * sizeof(int))

#define va_start(ap, pN) ((ap) = ((va_list) __builtin_next_arg(pN)))

#define va_end(ap)	((void)0)

#define va_arg(ap, t)	\
(((ap) = (ap) + __va_argsiz(t)), *((t*) (void*) ((ap) - __va_argsiz(t))))

int isdigit(char c){
 return c >= '0' && c <= '9';
}

int isspace(char c){
 return c == ' ' || c == '\n' || c == '\r' || c == '\t';
}

void cbinit(cbuff* buff){
  b_ = e_ = 0;
}

int cbsize(cbuff *buff){
  int result = e_ - b_;
  if(result < 0){
    result += CBUFF_SIZE;
  }
  return result;
}

void cbwrite(cbuff *buff, char c){
  c_ [ e_ ] = c;
  add1( e_ );
  if( e_ == b_ ){
    add1( b_ );
  }
}

int cbpeak(cbuff *buff, char *c){
  if( b_ == e_ ){ //Buffer is empty
    return -1;
  }
  *c = c_ [ b_ ];
  return 0;
}

void cbpop(cbuff *buff){
  if( b_ == e_ ){
    //assert(0);
  }
  add1( b_ );
}

int cbread(cbuff *buff, char *c){
  if( b_ == e_ ){
    return -1;
  }
  *c = c_ [ b_ ];
  add1( b_ );
  return 0;
}

void flushcb(cbuff *b1, cbuff *b2){
  if(!b2){ //Write to /dev/null
    b1->begin = b1->end;
    return;
  }
  char c;
  while(!cbread(b1, &c)){
    cbwrite(b2, c);
  }
}

void cbaoti(cbuff *buff, int *index){
  char c;
  int i = 0;
  while(!cbpeak(buff, &c) && isspace(c)){cbpop(buff);}
  if(cbpeak(buff, &c) || !isdigit(c)){
    *index = -1;
  } else{
    while(!cbpeak(buff, &c) && isdigit(c)){
      i *= 10;
      i += c - '0';
      cbpop(buff);
    }
    *index = i;
  }
}

void cbputdig(cbuff* buff, int n, unsigned int val) {
  int temp = val;
  int divisor = 1;
  while( temp > 0 && n > 0 ){
    divisor *= 10;
    temp /= 10;
    n--;
  }
  divisor /= 10;
  while( n-- > 0 ) cbwrite(buff, '0');
  while(val > 0){
    cbwrite(buff, '0'+(val / divisor));
    val %= divisor;
    divisor /= 10;
  }
}

void bwout(cbuff* buff){
  vint *flags2 = (int *)( UART2_BASE + UART_FLAG_OFFSET );
  vint *data2 = (int *)( UART2_BASE + UART_DATA_OFFSET );
  char c;
  while(!cbpeak(&buff, &c)){
    if(!( *flags2 & TXFF_MASK )){
      *data2 = c;
      cbpop(&buff);
    }
  }
}

//What follows is a slight modification of the bwio implementation

char c2hex( char ch ) {
  if ( (ch <= 9) ) return '0' + ch;
  return 'a' + ch - 10;
}

void cbputx(cbuff *buff, char c) {
  cbwrite(buff, c2hex( c / 16 ));
  cbwrite(buff, c2hex( c % 16 ));
}

void cbputr(cbuff* buff, unsigned int reg){
  int byte;
  char *ch = (char *) &reg;
  for( byte = 3; byte >= 0; byte-- ) cbputx(buff, ch[byte]);
}

void cbputstr(cbuff* buff, char *str) {
  while( *str ) {
    cbwrite(buff, *str);
    str++;
  }
}

void cbputw(cbuff* buff, int n, char fc, char *bf ) {
  char ch;
  char *p = bf;

  while( *p++ && n > 0 ) n--;
  while( n-- > 0 ) cbwrite(buff, fc );
  while( ( ch = *bf++ ) ) cbwrite(buff, ch );
}

int cba2d( char ch ) {
  if( ch >= '0' && ch <= '9' ) return ch - '0';
  if( ch >= 'a' && ch <= 'f' ) return ch - 'a' + 10;
  if( ch >= 'A' && ch <= 'F' ) return ch - 'A' + 10;
  return -1;
}

char cba2i( char ch, char **src, int base, int *nump ) {
  int num, digit;
  char *p;

  p = *src; num = 0;
  while( ( digit = cba2d( ch ) ) >= 0 ) {
    if ( digit > base ) break;
    num = num*base + digit;
    ch = *p++;
  }
  *src = p; *nump = num;
  return ch;
}

void cbui2a( unsigned int num, unsigned int base, char *bf ) {
  int n = 0;
  int dgt;
  unsigned int d = 1;

  while( (num / d) >= base ) d *= base;
  while( d != 0 ) {
    dgt = num / d;
    num %= d;
    d /= base;
    if( n || dgt > 0 || d == 0 ) {
      *bf++ = dgt + ( dgt < 10 ? '0' : 'a' - 10 );
      ++n;
    }
  }
  *bf = 0;
}

void cbi2a( int num, char *bf ) {
  if( num < 0 ) {
    num = -num;
    *bf++ = '-';
  }
  cbui2a( num, 10, bf );
}

void cbformat (cbuff* buff, char *fmt, va_list va ) {
  char bf[12];
  char ch, lz;
  int w;
  while ( ( ch = *(fmt++) ) ) {
    if ( ch != '%' )
    cbwrite(buff, ch );
    else {
      lz = 0; w = 0;
      ch = *(fmt++);
      switch ( ch ) {
        case '0':
        lz = 1; ch = *(fmt++);
        break;
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        ch =cba2i( ch, &fmt, 10, &w );
        break;
      }
      switch( ch ) {
        case 0: return;
        case 'c':
        cbwrite(buff, va_arg( va, char ) );
        break;
        case 's':
        cbputw(buff, w, 0, va_arg( va, char* ) );
        break;
        case 'u':
        cbui2a( va_arg( va, unsigned int ), 10, bf );
        cbputw(buff, w, lz, bf );
        break;
        case 'd':
        cbi2a( va_arg( va, int ), bf );
        cbputw(buff, w, lz, bf );
        break;
        case 'x':
        cbui2a( va_arg( va, unsigned int ), 16, bf );
        cbputw( buff, w, lz, bf );
        break;
        case '%':
        cbwrite(buff, ch );
        break;
      }
    }
  }
}

void cbprintf(cbuff* buff, char *fmt, ... ) {
  va_list va;
  va_start(va,fmt);
  cbformat(buff, fmt, va );
  va_end(va);
}
