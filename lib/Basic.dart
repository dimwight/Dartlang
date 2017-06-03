class Calculator {
  int _add;

  get add => _add;

  Calculator(this._add,[this.calculate_]);

  Function calculate_;

  int calculate() {
    if (calculate_ != null) return calculate_(this);
    return add;
  }
}


