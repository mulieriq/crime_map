import 'package:flutter_test/flutter_test.dart';
import '../../../../lib/src/utils/app_extenstions.dart';

void main() {
  test('Test string extention', (() {
    //Arrange
    String _fName = 'Eric';
    String _lName = 'Muli';

    //Act

    String _fullName = _fName & _lName;
    //Assert

    expect(_fullName, 'Eric Muli');
  }));
}
