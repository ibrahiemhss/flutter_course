
void main() {

  //Example 1--passing Function to Higher-Order Function
  Function addNum = (a,b) =>  print (a+b);
  someOtherfunction("hello", addNum);

  //Example 2--Recieving Function from Higher-Order Function
  var myFunction=taskFunction();
  print(myFunction(10));//<===multiplyFour(10); // num*10 //10*4  ===  output 40

}

//Example 1 Accepted function as a parameter
void someOtherfunction(String message,Function myFunc){//<====Higher-Order Function

  print(message);
  myFunc(2,5); //<===addNum(2,4) //print( a + b ); // print(2+4) === output 7
}

//Example 1 Return a Function
Function taskFunction(){//<===Higher-Order Function
  Function multiplyFour=(int num)=>num*4;
  return multiplyFour;
}