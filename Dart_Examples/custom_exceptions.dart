
void main() {
  try{
      depositMoney(-2);

  }catch(e){
        print(e.errorMessage());

  }
}

class DepositException implements Exception {
  String errorMessage() {
    return "cannot enter amount less than 0";
  }
}

void depositMoney(int amount) {
  if (amount < 0) {
    throw new DepositException();
  }
}
