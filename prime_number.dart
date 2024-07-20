import 'dart:io';

void main() {
  String? input = '';
  int number = 0;

  while (true) {
    stdout.write('Enter a number: ');
    input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print('Invalid input. Please enter a number.');
      continue;
    }

    try {
      number = int.parse(input);
    } catch (error) {
      print('Your input is not an integer, try again \u{1F641}!');
      continue;
    }

    bool isPrime = checkPrime(number);

    if (isPrime) {
      print('$number is a prime number.');
    } else {
      print('$number is not a prime number.');
    }

    stdout.write('Would you like to try the application again(yes/no): ');
    String? choice = stdin.readLineSync()?.toLowerCase();

    if (choice == 'yes') {
      continue;
    } else {
      print('Thank you for using our application \u{1F600}!');
      break;
    }
  }
}

bool checkPrime(int n) {
  if (n <= 1) return false;
  if (n == 2) return true;
  if (n % 2 == 0) return false;
    
  for (int i = 3; i * i <= n; i+=2) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}