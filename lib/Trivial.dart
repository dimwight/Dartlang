///Defines exportable interface
abstract class Adding {
  final int _first;

  int _getFirst() => _first;

  int setSecond(int second);

  String newSumText();

  Adding(this._first);

}

///Supplies basic mechanisms.
class Core extends Adding {
  int _second;

  @override
  int setSecond(int second) => this._second = second;

  _getSecond() => this._second;

  String get _firstText => '${_getFirst()}';

  String get _secondText => '${_getSecond()}';

  String get _sumText => '${_getFirst() + _getSecond()}';

  Core(int first) : super(first);

  @override
  String newSumText() {
    return '${runtimeType}.output: $_firstText + $_secondText = ${_sumText}';
  }
}

///Type everything you can!
typedef int GetNumberValue();
typedef String GetNumberText(int n);

/// Parameter object with two exported constructors,
/// one with built-in default
class Getter {

  final GetNumberValue getFirstFn;
  GetNumberText getText;

  final int first;

  Getter({this.getFirstFn, this.first = -1,
    this.getText}) {
//  Has to be set in body, so not final
    this.getText = getText != null ? getText
        : (int n) => '$n';
  }

  int getFirst() => getFirstFn == null ? first : getFirstFn();

}

///Exactly the same interface, overrides methods to use Getter
class WithGetter extends Core {
  final Getter _getter;

  WithGetter(Getter this._getter)
      : super(_getter.getFirst());

  @override
  int _getFirst() => _getter.getFirst();

  @override
  String get _firstText => _getter.getText(_getFirst());

  @override
  String get _secondText => _getter.getText(_getSecond());

  @override
  String get _sumText => _getter.getText(_getFirst() + _getSecond());

}