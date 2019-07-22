#include <stdio.h>

#define BUFLEN 512

void main(void)
{
char buf[BUFLEN];
char *c;
int i=1;

while(fgets(buf,BUFLEN,stdin))
	{
	if (buf[0]=='*') continue;
	if (i++==3)
	    {
	    if ((buf[0]!='#')&&(buf[0]!='^')) {
		printf("#1 0 0\n%s", buf);
		continue;
		}
	    }
	printf("%s",buf);
	buf[0]=0;
	}
}
