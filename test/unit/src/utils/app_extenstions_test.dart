import 'package:flutter_test/flutter_test.dart';
import '../../../../lib/src/utils/app_extenstions.dart';

void main() {
  group('Test string extention', () {
    test('Should return fullname', (() {
      //Arrange
      String _fName = 'Eric';
      String _lName = 'Muli';

      //Act

      String _fullName = _fName & _lName;
      //Assert

      expect(_fullName, 'Eric Muli');
    }));

  });
}
