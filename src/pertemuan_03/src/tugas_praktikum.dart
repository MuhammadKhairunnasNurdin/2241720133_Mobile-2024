void main() {
  for (int i = 0; i <= 201; i++) {
    if (!isPrime(i)) {
      continue;
    }
    print('===============================');
    print('Bilangan Prima: $i');
    print('Nama : Muhammad Khairunnas Nurdin');
    print('NIM : 2241720133');
  }
}

bool isPrime(int number){
  if (number <= 1){
    return false;
  }
  for (int i = 2; i <= number / 2; i++){
    if (number % i == 0){
      return false;
    }
  }
  return true;
}