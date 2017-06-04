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
typedef int NumberValue();
typedef String NumberText(int n);

/// Parameter object with its own optional parameters
class Coupler {

  final NumberValue firstFn;
  NumberText numberTextFn;

  final int first;

  Coupler({this.first = -1, this.firstFn, this.numberTextFn}) {
//  Has to be set in body, so not final
    this.numberTextFn = numberTextFn != null ? numberTextFn
        : (int n) => '$n';
  }

  int getFirst() => firstFn == null ? first : firstFn();

}

///Exactly the same interface, overrides methods to use Getter
class WithGetter extends Core {
  final Coupler _getter;

  WithGetter(Coupler this._getter)
      : super(_getter.getFirst());

  @override
  int _getFirst() => _getter.getFirst();

  @override
  String get _firstText => _getter.numberTextFn(_getFirst());

  @override
  String get _secondText => _getter.numberTextFn(_getSecond());

  @override
  String get _sumText => _getter.numberTextFn(_getFirst() + _getSecond());

}