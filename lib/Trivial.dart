///Defines exportable interface.
abstract class SumTwoNums {
  final num _firstNum;

  SumTwoNums(this._firstNum);

  setSecondNum(num second);

  String newOutputText();

}

///Supplies basic mechanisms.
class Core extends SumTwoNums {
  num _second;

  @override
  setSecondNum(num second) => this._second = second;

  _getSecond() => this._second;

  String get _firstText => '${_firstNum}';

  String get _secondText => '${_getSecond()}';

  String get _sumText => '${_firstNum + _getSecond()}';

  Core(num first) : super(first);

  @override
  String newOutputText() {
    return '${runtimeType}.output: $_firstText + $_secondText = ${_sumText}';
  }
}

///Type everything you can!
typedef num NumValue();
typedef String NumText(num n);

/// Parameter object with its own optional parameters
class Coupler {

  final NumValue firstFn;
  NumText numTextFn;

  final num first;

  Coupler({this.first = -1, this.firstFn, this.numTextFn}) {
//  Has to be set in body, so not final
    this.numTextFn = numTextFn != null ? numTextFn
        : (num n) => '$n';
  }

  num getFirst() => firstFn == null ? first : firstFn();

  output(String newSumText) {
    print('$newSumText');

  }

}

///Exactly the same interface, overrides methods to use Coupler.
class WithCoupler extends Core {
  final Coupler _coupler;

  WithCoupler(Coupler this._coupler)
      : super(_coupler.getFirst());

  @override
  setSecondNum(num second){
    super.setSecondNum(second);
    _coupler.output(this.newOutputText());
  }

  @override
  num _getFirstNum() => _coupler.getFirst();

  @override
  String get _firstText => _coupler.numTextFn(_getFirstNum());

  @override
  String get _secondText => _coupler.numTextFn(_getSecond());

  @override
  String get _sumText => _coupler.numTextFn(_getFirstNum() + _getSecond());

}