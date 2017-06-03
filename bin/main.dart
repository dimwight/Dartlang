/* Trying out Dart alternatives to Java anonymous local classes,
* particularly for use as parameter objects.*/
import 'package:Dartlang/Hierarchy.dart';

/*Top-level function for passing to Getter, with local closure  */
String getText(int a) {
  String size = a < 6 ? small : a < 10 ? larger : big;
  return '$a (a $size number)';
}

String small = 'small',
    larger = 'larger',
    big = 'big';

Getter getNumbers = new Getter( //Uses default for text
        () => 5,
        () => 6),
    getTexts = new Getter(
            () => 5,
            () => 6,
        /*Passes in closure thus simulating Java*/
        getText);

main(List<String> arguments) {
  Adding core = new Core(1, 2),
      functions = new WithFunctions(() => 3, () => 4),
      gettingNumbers = new WithGetter(getNumbers),
      gettingTexts = new WithGetter(getTexts);
  <Core>[
    core,
    functions,
    gettingNumbers,
    gettingTexts
  ].forEach((Core a) => print('${a.output()}'));
}

