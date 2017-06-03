class Adder {
  final int _first, _second;

  String get firstText => '$_first';

  String get secondText => '$_second';

  String get sumText => '${_first + _second}';

  Adder(this._first, this._second);

  String output() {
    return '${runtimeType}.output: $firstText + $secondText = ${sumText}';
  }
}

class Functions extends Adder {
  Functions(int first(), int second()) : super(first(), second());
}

typedef int GetNumber();
typedef String GetText(int n);

class Getter {
  final GetNumber getFirst, getSecond;
  GetText getText;

  Getter(this.getFirst, this.getSecond, [getText]) {
    this.getText = getText != null ? getText
        : (int n) => '$n';
  }
}

class Getting extends Adder {
  final Getter getter;

  Getting(Getter this.getter) : super(getter.getFirst(), getter.getSecond());

  @override
  String get firstText => getter.getText(_first);

  @override
  String get secondText => getter.getText(_second);

  @override
  String get sumText => getter.getText(_first + _second);

}