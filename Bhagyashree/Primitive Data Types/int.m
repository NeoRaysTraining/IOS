#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  //integer variables declaration and printing
  
  //short type of variables
  
  short aShort = 11;
  NSLog (@"val of aShort:%hd", aShort);
  
  unsigned short anunsignedShort = -11;
  NSLog (@"val of aShort:%hu", anunsignedShort);
 
 
  //int type of variables
  
  int aInt = -11;
  NSLog (@"val of aInt :%d", aInt);
  
  unsigned int anunsignedint = 11;
  NSLog (@"val of anuint :%u", anunsignedint);
 
  //long type of variables
  
  long aLong = -1111111111111;
  NSLog (@"val of aLong :%ld", aLong);
  
  unsigned long anunsignedlong = 1111111111111;
  NSLog (@"val of anuint :%lu", anunsignedlong);
  
   //long long type of variables
  
  long long aLongLong = -765482176126;
  NSLog (@"val of aLongLong :%lld", aLongLong);
  
  unsigned long long anunsignedlonglong = 89627865873627;
  NSLog (@"val of anulonglong :%llu", anunsignedlonglong);
 
  
   NSLog (@"hello world");
   [pool drain];
   return 0;
}
