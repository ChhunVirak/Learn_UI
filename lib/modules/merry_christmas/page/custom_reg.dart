abstract class CustomReg {
  final digitsOnly = '\\d'; //0-9
  final denyDigits = '\\D'; //any beside 0-9
  final noSpace = '\\S'; //No white Space
  final word = '\\w'; //a-z A-Z 0-9 and _
  final twoDigits = '^0'; //use^ to check start with
  final passwordValidate =
      '/^((?=\\S*?[A-Z])(?=\\S*?[a-z])(?=\\S*?[0-9]).{6,})\\S\$/';
}
