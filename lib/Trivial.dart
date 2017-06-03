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

/// Parameter object with two exported constructors,
/// one with built-in default
class Getter {

  final GetNumberValue getFirstFn, getSecondFn;

//Can't be final; a small language inconsistency?
  GetNumberText getText;

  final int _first,_second;

  Getter._core(this.getFirstFn, this.getSecondFn,
      this._first, this._second,
      [getText]) {
//  Has to be set in body, so not final
    this.getText = getText != null ? getText
        : (int n) => '$n';
  }

  Getter.fn(GetNumberValue getSmall, GetNumberValue getLarger,
  [Function getText]):
    this._core(getSmall,getLarger,-1,-1,getText);

  Getter.num(int small, int larger)
  :this._core(null,null,small,larger,null);

  int getFirst()=>getFirstFn==null?_first:getFirstFn();
  int getSecond()=>getSecondFn==null?_second:getSecondFn();
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