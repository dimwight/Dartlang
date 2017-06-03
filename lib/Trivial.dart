///Defines exportable interface
abstract class Adding {
  final int _first, _second;

  int _getFirst ()=> _first;

  int _getSecond ()=> _second;

  Adding(this._first, this._second);

  String output();
}
///Supplies basic mechanism.
class Core extends Adding {

  String get _firstText => '${_getFirst()}';

  String get _secondText => '${_getSecond()}';

  String get _sumText => '${_getFirst() + _getSecond()}';

  Core(first, second) : super(first, second);

  @override
  String output() {
    return '${runtimeType}.output: $_firstText + $_secondText = ${_sumText}';
  }
}

///Type everything you can!
typedef int GetNumberValue();
typedef String GetNumberText(int n);

/// Parameter object with two exported constructors,
/// one with built-in default
class Getter {

  final GetNumberValue getFirstFn, getSecondFn;
  GetNumberText getText;

  final int first,second;

  Getter({this.getFirstFn, this.getSecondFn,
      this.first=-1, this.second=-1,
      this.getText}) {
//  Has to be set in body, so not final
    this.getText = getText != null ? getText
        : (int n) => '$n';
  }

  int getFirst()=>getFirstFn==null?first:getFirstFn();
  int getSecond()=>getSecondFn==null?second:getSecondFn();
}

///Exactly the same interface, overrides methods to use Getter
class WithGetter extends Core {
  final Getter _getter;

  WithGetter(Getter this._getter)
      : super(_getter.getFirst(), _getter.getSecond());

  @override
  int _getFirst ()=> _getter.getFirst();
  @override
  int _getSecond ()=> _getter.getSecond();
  @override
  String get _firstText => _getter.getText(_getFirst ());

  @override
  String get _secondText => _getter.getText(_getSecond ());

  @override
  String get _sumText => _getter.getText(_getFirst () + _getSecond ());

}