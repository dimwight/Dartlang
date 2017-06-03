///Defines exportable interface
abstract class Adding {
  final int _first, _second;

  Adding(this._first, this._second);

  String output();
}
///Supplies basic mechanism.
class Core extends Adding {

  String get _firstText => '$_first';

  String get _secondText => '$_second';

  String get _sumText => '${_first + _second}';

  Core(first, second) : super(first, second);

  @override
  String output() {
    return '${runtimeType}.output: $_firstText + $_secondText = ${_sumText}';
  }
}

///Type everything you can!
typedef int GetNumberValue();
typedef String GetNumberText(int n);

///An obvious extension using functions to supply parameters
class WithFunctions extends Core {
  WithFunctions(GetNumberValue first, GetNumberValue second)
      : super(first(), second());
}

/// Bundles parameter functions, one with built-in default
class Getter {

  final GetNumberValue getFirst, getSecond;

//Can't be final; a small language inconsistency?
  GetNumberText getText;

  Getter(this.getFirst, this.getSecond, [getText]) {
//  Has to be set in body, so not final
    this.getText = getText != null ? getText
        : (int n) => '$n';
  }
}

///Exactly the same interface, overrides methods to use Getter
class WithGetter extends Core {
  final Getter _getter;

  WithGetter(Getter this._getter)
      : super(_getter.getFirst(), _getter.getSecond());

  @override
  String get _firstText => _getter.getText(_first);

  @override
  String get _secondText => _getter.getText(_second);

  @override
  String get _sumText => _getter.getText(_first + _second);

}