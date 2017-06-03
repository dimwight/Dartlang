import 'package:Dartlang/Trivial.dart';

///Top-level function for passing to Getter, with local closure  
String getText(int a) {
  String size = a < 6 ? small : a < 10 ? larger : big;
  return '$a (a $size number)';
}

String small = 'small',
    larger = 'larger',
    big = 'big';

GetNumberValue getSmall=() => 5,getLarger=() => 7;

Getter getNumbers = new Getter(getSmall,getLarger),//Uses default for text
    getTexts = new Getter(
        getSmall,getLarger,
        ///Passes in closure thus simulating Java anonymous local
        getText);

main(List<String> arguments) {
  //Abstract types
  Adding core = new Core(1, 2),//Basic mechanism
      gettingNumbers = new WithGetter(getNumbers),
      gettingTexts = new WithGetter(getTexts);
  <Core>[
    core,
    gettingNumbers,
    gettingTexts
  ].forEach((Core a) => print('${a.output()}'));
}

