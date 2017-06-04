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
    firstFn: smallNumFn), //Dynamic number

///Mixing parameters and closures to simulate Java anonymous locals
///overriding inherited methods
    getNumbersFn = new Getter(firstFn: smallNumFn),
    getTexts = new Getter(first: 6, numberTextFn: getText);

main(List<String> arguments) {
  //Abstract types
  Adding core = new Core(smallNum), //Basic mechanism
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
    a.setSecond(largerNum+=2);
    print('${a.newSumText()}');
  });
}


int smallNumFn() {
  if(false)print('smallNumFn: $smallNum');
  return smallNum;
}
