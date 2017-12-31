private Item[] store = 
{
  new Item(184, 14), 
  new Item(196, 60), 
  new Item(206, 31), 
  new Item(2370, 65), 
  new Item(7282, 73), 
  new Item(8303, 90), 
  new Item(12328, 63), 
  new Item(12705, 14), 
  new Item(13066, 8), 
  new Item(14088, 92), 
  new Item(15320, 82), 
  new Item(15814, 60), 
  new Item(15917, 51), 
  new Item(17911, 96), 
  new Item(18061, 3), 
  new Item(18410, 56), 
  new Item(18465, 27), 
  new Item(18618, 64), 
  new Item(18871, 69), 
  new Item(19967, 45)
};                             
public int linearSearch(int catNumToFind)
{
  for (int i = 0; i < store.length; i++) {
    if (store[i].getCatNum() == catNumToFind) {
      return store[i].getInventory();
    }
    //basic, run through array till find
  }
  return -1;
}
public int recursiveLinearSearch(int catNumToFind, int startIndex)
{
  //if your startindex is a higher number than final index in array, end
  if (startIndex >= store.length) {
    return -1;
  }
  //if you have your thing, return the inventory
  else if (store[startIndex].getCatNum() == catNumToFind) {
    return store[startIndex].getInventory();
  }
  else {
    //otherwise increase start index and go again
    return recursiveLinearSearch(catNumToFind, startIndex+1);
  }
}
public int binarySearch(int catNumToFind)
{
  //low guess is 0, start of array. high guess is final position in array, length-1
  int nLow = 0;
  int nHigh = store.length-1;
  while (nLow <= nHigh) {
    //while your low guess is less than or equal to your high guess, do stuff.
    int mid = (nLow+nHigh)/2; //this is going to go to the middle of the array
    if (store[mid].getCatNum() == catNumToFind) {
      //if you have ur stuff, return inventory
      return store[mid].getInventory();
    }
    else if (store[mid].getCatNum() > catNumToFind) {
      //since sorted array, if your catnum is greater than what you want, then you can discount all stuff above your current high, so you want to move high down to below current position
      nHigh = mid-1;
    }
    else if (store[mid].getCatNum() < catNumToFind) {
      //if less than your wanted stuff, your low can be moved to above your current position.
      nLow = mid+1;
    }
  }   
  return -1;
}
public int recursiveBinarySearch(int catNumToFind, int nLow, int nHigh)
{
  int mid = (nLow+nHigh)/2; //middle of array
  if (nLow > nHigh) {
    //if low guess greater than high guess
    return -1;
  }
  else if (store[mid].getCatNum() == catNumToFind) {
    //if found, return inventory
    return store[mid].getInventory();
  }
  else if (store[mid].getCatNum() > catNumToFind) {
    //if greater, run function again but high is below current position
    return recursiveBinarySearch(catNumToFind,nLow,mid-1);
  }
  else {
    //run again but low is above current position
    return recursiveBinarySearch(catNumToFind,mid+1,nHigh);
  }
}
public void setup()
{
  int[] tests = {0, 183, 184, 2370, 15320, 19967, 19968};
  System.out.println();
  System.out.println("Testing Non-Recursive Linear Search");
  System.out.println("=====================");
  for (int i = 0; i < tests.length; i++)
  {

    if (linearSearch(tests[i]) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+linearSearch(tests[i]) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Recursive Linear Search");
  System.out.println("=====================");
  for (int i = 0; i < tests.length; i++)
  {

    if (recursiveLinearSearch(tests[i],0) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+recursiveLinearSearch(tests[i],0) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Non-Recursive Binary Search");
  System.out.println("===================================");
  for (int i = 0; i < tests.length; i++)
  {

    if (binarySearch(tests[i]) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+binarySearch(tests[i]) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Recursive Binary Search");
  System.out.println("===============================");
  for (int i = 0; i < tests.length; i++)
  {

    if (recursiveBinarySearch(tests[i], 0, store.length - 1) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+recursiveBinarySearch(tests[i], 0, store.length - 1) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
}

public void draw()
{
  //empty!
}