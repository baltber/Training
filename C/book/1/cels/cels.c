#include <stdio.h>

int main()
{
  float fahr, celcius;
  int lower, upper, step;
  lower = -40;
  upper = 50;
  step = 5;
  celcius = lower;
  printf("Table Farengeit -> Celsium\n");
  while(celcius <= upper){
    fahr = (9.0 / 5.0) * (celcius + 32.0);
    printf("%3.0f%6.1f\n", celcius, fahr);
    celcius = celcius + step;
  }
}
