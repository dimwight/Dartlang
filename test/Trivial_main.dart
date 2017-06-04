import 'package:Dartlang/Trivial.dart';

///Top-level function for passing to Getter, with local closure  
String smallTxt = 'small',
    largerTxt = 'larger',
    bigTxt = 'big';

String getText(int a) {
  String size = a < 6 ? smallTxt : a < 10 ? largerTxt : bigTxt;
  return '$a (a $size number)';
}

int smallNum = 1,
    largerNum = 1;

///Range of constructors
Coupler getNumbers = new Coupler(
    firstFn: smallNumFn), //Dynamic number

///Mixing parameters and closures to simulate Java anonymous locals
///overriding inherited methods
    getNumbersFn = new Coupler(firstFn: smallNumFn),
    getTexts = new Coupler(first: smallNum, numberTextFn: getText);

main(List<String> arguments) {
  //Abstract types
  Adding core = new Core(smallNum), //Basic mechanism
      gettingNumbers = new WithCoupler(getNumbers),
      gettingNumbersFn = new WithCoupler(getNumbersFn),
      gettingTexts = new WithCoupler(getTexts);
  <Core>[
    core,
    gettingNumbers,
    gettingNumbersFn,
    gettingTexts
  ].forEach((Core a) {
    a.setSecond(largerNum += 2);
    print('${a.newSumText()}');
    smallNum += 1;
  });
}

int smallNumFn() {
  if (false) print('smallNumFn: $smallNum');
  return smallNum;
}
