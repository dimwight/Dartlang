import 'package:Dartlang/Nesting.dart';

String getText(int a) {
  String size = a < 6 ? 'small' : a < 10 ? 'larger' : 'big';
  return '$a (a $size number)';
}

Getter
getNumbers = new Getter(
        () => 5,
        () => 6),
    getTexts = new Getter(
            () => 5,
            () => 6,
        getText);

main(List<String> arguments) {
  Adder
  simple = new Adder(1, 2),
      functions = new Functions(() => 3, () => 4),
      gettingNumbers = new Getting(getNumbers),
      gettingTexts = new Getting(getTexts);
  <Adder>[
    simple,
    functions,
    gettingNumbers,
    gettingTexts
  ].forEach((Adder a) {
    print('${a.output()}');
  });
}

