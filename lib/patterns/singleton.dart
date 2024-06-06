class Student {
  static Student? _instance;
  static int _initializationCount = 0; //track initialization

  Student._internal() {
    _initializationCount++;
  }

  factory Student() {
    if (_instance == null) {
      _instance = Student._internal();
    }
    return _instance!;
  }

  static int getInitializationCount() {
    return _initializationCount;
  }
}

/*void main() {
  Student();
  Student();
  Student();

  print('Initialization count: ${Student.getInitializationCount()}');
}
*/

