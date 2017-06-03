import 'package:Dartlang/Trivial.dart';

///Top-level function for passing to Getter, with local closure  
String getText(int a) {
  String size = a < 6 ? smallTxt : a < 10 ? largerTxt : bigTxt;
  return '$a (a $size number)';
}

String smallTxt = 'small',
    largerTxt = 'larger',
    bigTxt = 'big';

int smallNum = 1,
    largerNum = 2;

///Range of constructors
Getter getNumbers = new Getter(
    first: smallNum, second: largerNum), //Simple numbers fixed at construction

///Mixing parameters and closures to simulate Java anonymous locals
///overriding inherited methods
    getNumbersFn = new Getter(getFirstFn: () => smallNum,
        getSecondFn: () => smallNum),
    getTexts = new Getter(first: 6, second: 10, getText: getText);

main(List<String> arguments) {
  //Abstract types
  Adding core = new Core(smallNum, largerNum), //Basic mechanism
      gettingNumbers = new WithGetter(getNumbers),
      gettingNumbersFn = new WithGetter(getNumbersFn),
      gettingTexts = new WithGetter(getTexts);
  <Core>[
    core,
    gettingNumbers,
    gettingNumbersFn,
    gettingTexts
  ].forEach((Core a) {
    smallNum+=1;
    largerNum+=2;
    print('${a.output()}');
  });
}

