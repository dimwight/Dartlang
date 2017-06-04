///Defines exportable interface.
abstract class AddTwoNums {
  final num _firstNum;

  num _getFirstNum() => _firstNum;

  num setSecondNum(num num);

  String newSumText();

  AddTwoNums(this._firstNum);

}

///Supplies basic mechanisms.
class Core extends AddTwoNums {
  num _second;

  @override
  num setSecondNum(num second) => this._second = second;

  _getSecond() => this._second;

  String get _firstText => '${_getFirstNum()}';

  String get _secondText => '${_getSecond()}';

  String get _sumText => '${_getFirstNum() + _getSecond()}';

  Core(num first) : super(first);

  @override
  String newSumText() {
    return '${runtimeType}.output: $_firstText + $_secondText = ${_sumText}';
  }
}

///Type everything you can!
typedef num NumberValue();
typedef String NumberText(num n);

/// Parameter object with its own optional parameters
class Coupler {

  final NumberValue firstFn;
  NumberText numberTextFn;

  final num first;

  Coupler({this.first = -1, this.firstFn, this.numberTextFn}) {
//  Has to be set in body, so not final
    this.numberTextFn = numberTextFn != null ? numberTextFn
        : (num n) => '$n';
  }

  num getFirst() => firstFn == null ? first : firstFn();

}

///Exactly the same interface, overrides methods to use Coupler.
class WithCoupler extends Core {
  final Coupler _getter;

  WithCoupler(Coupler this._getter)
      : super(_getter.getFirst());

  @override
  num _getFirstNum() => _getter.getFirst();

  @override
  String get _firstText => _getter.numberTextFn(_getFirstNum());

  @override
  String get _secondText => _getter.numberTextFn(_getSecond());

  @override
  String get _sumText => _getter.numberTextFn(_getFirstNum() + _getSecond());

}