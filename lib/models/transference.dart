class Transference {
  final double value;
  final int accountNumber;

  Transference(this.value, this.accountNumber);

  String toStringValue() {
    return 'R\$ $value';
  }

  String toStringAccount() {
    return 'Account: $accountNumber';
  }
}
