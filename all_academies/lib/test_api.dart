void main() {
  print('Hello, World!');
  int add(int x, int y) {
    return x + y;
  }

  int a = 5; 

  int b = 3; 

  int sum = add(a, b); 
  print('Sum: $sum'); 

  int difference = subtract(a, b);
  print('Difference: $difference');

  int product = multiply(a, b);
  print('Product: $product');

  double quotient = divide(a, b);
  print('Quotient: $quotient');
}

int subtract(int x, int y) {
  return x - y;
}


int multiply(int x, int y) {
  return x * y;
}

double divide(int x, int y) {
  if (y == 0) {
    throw ArgumentError('Cannot divide by zero');
  }
  return x / y;
}
