import 'package:Dartlang/Trivial.dart';

///Top-level function for passing to Getter, with local closure  
String smallTxt = 'small',
    largerTxt = 'larger',
    bigTxt = 'big';

String getText(num a) {
  String size = a < 6 ? smallTxt : a < 10 ? largerTxt : bigTxt;
  return '$a (a $size number)';
}

num smallNum = 1,
    largerNum = 1;

///Range of constructors
Coupler getNumbers = new Coupler(
    first: smallNum), //Dynamic number

///Passing closures to simulate Java anonymous locals
///overriding inherited methods
    getNumbersFn = new Coupler(firstFn: smallNumFn),
    getTextsFn = new Coupler(firstFn: smallNumFn, numberTextFn: getText);

main(List<String> arguments) {
  //Abstract types
  AddTwoNums core = new Core(smallNum), //Basic mechanism
      coupledNumbers = new WithCoupler(getNumbers),
      coupledNumbersFn = new WithCoupler(getNumbersFn),
      coupledTexts = new WithCoupler(getTextsFn);
  <Core>[
    core,
    coupledNumbers,
    coupledNumbersFn,
    coupledTexts
  ].forEach((Core a) {
    a.setSecondNum(largerNum += 2);
    print('${a.newSumText()}');
    smallNum += 1;
  });
}

num smallNumFn() {
  if (false) print('smallNumFn: $smallNum');
  return smallNum;
}
