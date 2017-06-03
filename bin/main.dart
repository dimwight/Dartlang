import 'package:Dartlang/Trivial.dart';

///Top-level function for passing to Getter, with local closure  
String getText(int a) {
  String size = a < 6 ? small : a < 10 ? larger : big;
  return '$a (a $size number)';
}

String small = 'small',
    larger = 'larger',
    big = 'big';

GetNumberValue getSmall = () => 5,
    getLarger = () => 7;

///Range of constructors
Getter getNumbers = new Getter.num(6, 10), //Simple numbers

//Closures simulating Java anonymous local
    getNumbersFn = new Getter.fn(getSmall, getLarger),
    getTexts = new Getter.fn(getSmall, getLarger, getText);

main(List<String> arguments) {
  //Abstract types
  Adding core = new Core(1, 2), //Basic mechanism
      gettingNumbers = new WithGetter(getNumbers),
      gettingNumbersFn = new WithGetter(getNumbersFn),
      gettingTexts = new WithGetter(getTexts);
  <Core>[
    core,
    gettingNumbers,
    gettingNumbersFn,
    gettingTexts
  ].forEach((Core a) => print('${a.output()}'));
}

