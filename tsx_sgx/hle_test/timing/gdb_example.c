int add(int a, int b)
{
  return a + b;
}

int main()
{
  int sum[10] = 
  {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0     
  }  ;
  int i;
  
  int array1[10] =
  {
    48, 56, 77, 33, 33, 11, 226, 544, 78, 90
  };
  int array2[10] =
  {
    85, 99, 66, 0x199, 393, 11, 1, 2, 3, 4
  };

  for (i = 0; i < 10; i++)
  {
    sum[i] = add(array1[i], array2[i]);
  }

}
