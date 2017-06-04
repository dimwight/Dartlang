import 'package:Dartlang/Trivial.dart';

///Used by Coupler functions
num firstNum = 1,
    secondNum = 1;
String smallTxt = 'small',
    largerTxt = 'larger',
    bigTxt = 'big';

///Functions with local closure for passing to Coupler
num firstNumFn() => firstNum;

String newNumText(num n) {
  String size = n < 6 ? smallTxt : n < 10 ? largerTxt : bigTxt;
  return '$n (a $size number)';
}

///Range of Couplers
Coupler getNumber = new Coupler(
    first: firstNum), //Number passed directly

///Passing closures to simulate Java anonymous locals
///overriding inherited methods
    getNumFn = new Coupler(firstFn: firstNumFn),
    getTextsFn = new Coupler(firstFn: firstNumFn, numTextFn: newNumText);

main(List<String> arguments) {
  //Abstract types
  SumTwoNums core = new Core(firstNum), //Basic mechanism
      coupledNumbers = new WithCoupler(getNumber),
      coupledNumbersFn = new WithCoupler(getNumFn),
      coupledTexts = new WithCoupler(getTextsFn);
  <Core>[
    core,
    coupledNumbers,
    coupledNumbersFn,
    coupledTexts
  ].forEach((Core a) {
    a.setSecondNum(secondNum += 2);
    if(!(a is WithCoupler))print('${a.newOutputText()}');
    firstNum += 1;
  });
}