#include <stdio.h> 
#include <string.h> 
extern unsigned char ram[] ;
extern int hamming(void); 
int main()
{printf("Enter the first string: "); 
  fgets(ram, 256, stdin); 
  printf("Enter the second string: "); 
  fgets(ram + 256, 256, stdin); 
  int distance = hamming(); 
 return 0; 
}
