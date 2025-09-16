
// Lab 4 Solutions - Dart Console Programming
// Student: Akhmad Hurshetov 220122
// Lab Time: Monday 14:00

// -----------------------------
// 1. Classes
// -----------------------------

// 1.1 Sample — Simple Car class
class Car {
  String make;
  String model;
  int year;
  Car(this.make, this.model, this.year);
  void displayInfo() {
    print('Car Information: $year $make $model');
  }
}

void task1_1() {
  var myCar = Car('Toyota', 'Corolla', 2022);
  myCar.displayInfo();
}

// 1.2 Task 2 (Easy) — Book class
class Book {
  String title;
  String author;
  int numberOfPages;
  Book(this.title, this.author, this.numberOfPages);
  void showInfo() {
    print('Title: $title\nAuthor: $author\nPages: $numberOfPages');
  }
}

void task1_2() {
  var book = Book('1984', 'George Orwell', 328);
  book.showInfo();
}

// 1.3 Task 3 (Easy) — Student class
class Student {
  String name;
  int age;
  List<double> grades;
  Student(this.name, this.age, this.grades);
  double calculateAverageGrade() {
    if (grades.isEmpty) return 0.0;
    double sum = grades.reduce((a, b) => a + b);
    return sum / grades.length;
  }
}

void task1_3() {
  var s = Student('Ali', 20, [90.0, 85.5, 78.0]);
  print('Average grade of ${s.name}: ${s.calculateAverageGrade().toStringAsFixed(2)}');
}

// 1.4 Task 4 (Medium) — BankAccount
class BankAccount {
  String accountNumber;
  String accountHolderName;
  double balance;
  BankAccount(this.accountNumber, this.accountHolderName, [this.balance = 0.0]);
  void deposit(double amount) {
    if (amount <= 0) {
      print('Deposit amount must be positive.');
      return;
    }
    balance += amount;
    print('Deposited \$${amount.toStringAsFixed(2)}. New balance: \$${balance.toStringAsFixed(2)}');
  }
  void withdraw(double amount) {
    if (amount <= 0) {
      print('Withdraw amount must be positive.');
      return;
    }
    if (amount > balance) {
      print('Error: insufficient funds. Current balance: \$${balance.toStringAsFixed(2)}');
      return;
    }
    balance -= amount;
    print('Withdrew \$${amount.toStringAsFixed(2)}. New balance: \$${balance.toStringAsFixed(2)}');
  }
}

void task1_4() {
  var acc = BankAccount('ACC123', 'Bekzod', 100.0);
  acc.deposit(50);
  acc.withdraw(30);
  acc.withdraw(200);
}

// 1.5 Task 5 (Medium) — Rectangle
class Rectangle {
  double width;
  double height;
  Rectangle(this.width, this.height);
  double get area => width * height;
  double get perimeter => 2 * (width + height);
}

void task1_5() {
  var rect = Rectangle(4.5, 3.0);
  print('Area: ${rect.area}');
  print('Perimeter: ${rect.perimeter}');
}

// -----------------------------
// 2. Enums
// -----------------------------

enum DaysOfWeek { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

void checkDay(DaysOfWeek day) {
  switch (day) {
    case DaysOfWeek.saturday:
    case DaysOfWeek.sunday:
      print('$day is on the weekend!');
      break;
    default:
      print('$day is a weekday.');
  }
}

void task2_1() {
  checkDay(DaysOfWeek.monday);
  checkDay(DaysOfWeek.saturday);
}

// 2.2 Task 2 (Easy) — OrderStatus
enum OrderStatus { pending, processing, shipped, delivered, cancelled }

void task2_2() {
  OrderStatus status = OrderStatus.processing;
  print('Current status: $status');
}

// 2.3 Task 3 (Easy) — TrafficLight
enum TrafficLight { red, yellow, green }

String recommendAction(TrafficLight light) {
  switch (light) {
    case TrafficLight.red:
      return 'Stop';
    case TrafficLight.yellow:
      return 'Caution';
    case TrafficLight.green:
      return 'Go';
  }
}

void task2_3() {
  for (var color in TrafficLight.values) {
    print('$color -> ${recommendAction(color)}');
  }
}

// 2.4 Task 4 (Medium) — UserRole
enum UserRole { admin, editor, guest }

class User {
  String name;
  UserRole role;
  User(this.name, this.role);
  bool hasEditPermission() {
    return role == UserRole.admin || role == UserRole.editor;
  }
}

void task2_4() {
  var a = User('AdminAlice', UserRole.admin);
  var g = User('GuestGul', UserRole.guest);
  print('${a.name} can edit: ${a.hasEditPermission()}');
  print('${g.name} can edit: ${g.hasEditPermission()}');
}

// 2.5 Task 5 (Medium) — TrafficLight durations
extension TrafficLightDuration on TrafficLight {
  int get durationInSeconds {
    switch (this) {
      case TrafficLight.red:
        return 30;
      case TrafficLight.yellow:
        return 5;
      case TrafficLight.green:
        return 45;
    }
  }
}

void task2_5() {
  for (var t in TrafficLight.values) {
    print('$t duration: ${t.durationInSeconds} sec');
  }
}

// -----------------------------
// 3. Inheritance
// -----------------------------

class Animal {
  void makeSound() {
    print('Some animal sound');
  }
}

class Dog extends Animal {
  @override
  void makeSound() => print('Woof!');
}

class Cat extends Animal {
  @override
  void makeSound() => print('Meow!');
}

void task3_2() {
  var dog = Dog();
  var cat = Cat();
  dog.makeSound();
  cat.makeSound();
}

class Shape {
  String color;
  Shape(this.color);
}

class Circle extends Shape {
  double radius;
  Circle(String color, this.radius) : super(color);
}

class Square extends Shape {
  double sideLength;
  Square(String color, this.sideLength) : super(color);
}

void task3_3() {
  var c = Circle('red', 2.5);
  var s = Square('blue', 3.0);
  print('Circle color: ${c.color}, radius: ${c.radius}');
  print('Square color: ${s.color}, side: ${s.sideLength}');
}

class Employee {
  String name;
  double baseSalary;
  Employee(this.name, this.baseSalary);
  double calculateSalary() => baseSalary;
}

class Manager extends Employee {
  double bonus;
  Manager(String name, double baseSalary, this.bonus) : super(name, baseSalary);
  @override
  double calculateSalary() => baseSalary + bonus;
}

void task3_4() {
  var e = Employee('Worker', 1000);
  var m = Manager('Manager', 2000, 500);
  print('${e.name} salary: \$${e.calculateSalary()}');
  print('${m.name} salary: \$${m.calculateSalary()}');
}

abstract class LibraryItem {
  String title;
  int id;
  LibraryItem(this.title, this.id);
  String getDetails();
}

class BookItem extends LibraryItem {
  String author;
  BookItem(String title, int id, this.author) : super(title, id);
  @override
  String getDetails() => 'Book: $title (ID: $id) by $author';
}

class DVD extends LibraryItem {
  String director;
  DVD(String title, int id, this.director) : super(title, id);
  @override
  String getDetails() => 'DVD: $title (ID: $id) directed by $director';
}

void task3_5() {
  var b = BookItem('Dart for Beginners', 1, 'Author A');
  var d = DVD('Dart Movie', 2, 'Director B');
  print(b.getDetails());
  print(d.getDetails());
}

// -----------------------------
// 4. Mixins
// -----------------------------

mixin Flyer {
  void fly() => print('Taking off!');
}

class Bird with Flyer {
  String species;
  Bird(this.species);
}

class Plane with Flyer {
  String model;
  Plane(this.model);
}

void task4_2() {
  var b = Bird('Sparrow');
  var p = Plane('Boeing 737');
  b.fly();
  p.fly();
}

mixin Logger {
  void log(String message) => print('[LOG] $message');
}

class DataService with Logger {
  void fetchData() {
    log('Fetching data');
    log('Data fetched');
  }
}

void task4_3() {
  var service = DataService();
  service.fetchData();
}

mixin Validator {
  bool isEmailValid(String email) => email.contains('@') && email.contains('.');
  bool isPasswordStrong(String password) => password.length >= 8;
}

class UserSignup with Validator {
  void validate(String email, String password) {
    print('Email valid: ${isEmailValid(email)}');
    print('Password strong: ${isPasswordStrong(password)}');
  }
}

void task4_4() {
  var signup = UserSignup();
  signup.validate('user@example.com', 'Pa\$sword123');
  signup.validate('bademail', 'short');
}

mixin Performer {
  void perform() => print('Performing on stage');
}

mixin Musician {
  void playInstrument() => print('Playing an instrument');
}

class Artist {
  String name;
  Artist(this.name);
}

class Dancer extends Artist with Performer {
  Dancer(String name) : super(name);
}

class Guitarist extends Artist with Performer, Musician {
  Guitarist(String name) : super(name);
}

void task4_5() {
  var d = Dancer('Timo');
  var g = Guitarist('Sara');
  d.perform();
  g.perform();
  g.playInstrument();
}

// -----------------------------
// 5. Polymorphism
// -----------------------------

abstract class Weapon {
  void action();
}

class Sword extends Weapon {
  @override
  void action() => print('Swinging!');
}

class Bow extends Weapon {
  @override
  void action() => print('Firing!');
}

void task5_2() {
  List<Weapon> weapons = [Sword(), Bow()];
  for (var w in weapons) w.action();
}

abstract class Animal2 {
  void eat();
}

class Lion extends Animal2 {
  @override
  void eat() => print('Eating meat.');
}

class Goat extends Animal2 {
  @override
  void eat() => print('Eating grass.');
}

void feed(Animal2 animal) => animal.eat();

void task5_3() {
  feed(Lion());
  feed(Goat());
}

abstract class PaymentMethod {
  void pay(double amount);
}

class CreditCard implements PaymentMethod {
  @override
  void pay(double amount) => print('Paid \$${amount.toStringAsFixed(2)} with Credit Card');
}

class PayPal implements PaymentMethod {
  @override
  void pay(double amount) => print('Paid \$${amount.toStringAsFixed(2)} with PayPal');
}

void processPayment(PaymentMethod method, double amount) {
  method.pay(amount);
}

void task5_4() {
  processPayment(CreditCard(), 49.99);
  processPayment(PayPal(), 15.0);
}

abstract class DataFormatter {
  String format(Map<String, dynamic> data);
}

class JSONFormatter implements DataFormatter {
  @override
  String format(Map<String, dynamic> data) {
    return data.toString();
  }
}

class KeyValueFormatter implements DataFormatter {
  @override
  String format(Map<String, dynamic> data) {
    return data.entries.map((e) => '${e.key}: ${e.value}').join('\n');
  }
}

void task5_5() {
  Map<String, dynamic> sample = {'name': 'Alice', 'age': 30, 'active': true};
  List<DataFormatter> formatters = [JSONFormatter(), KeyValueFormatter()];
  for (var f in formatters) {
    print('--- ${f.runtimeType} ---');
    print(f.format(sample));
  }
}

// -----------------------------
// 6. Async Programming
// -----------------------------

Future<Map<String, dynamic>> fetchUserData() async {
  print('Fetching user data ...');
  await Future.delayed(Duration(seconds: 2));
  print('Data fetched!');
  return {'id': 101, 'name': 'Alice'};
}

void task6_1() async {
  print('Program started.');
  var userData = await fetchUserData();
  print('User Name: ${userData['name']}');
  print('Program finished.');
}

Future<String> generateReport1() {
  return Future.delayed(Duration(seconds: 1), () => 'Report generated!');
}

void task6_2() {
  generateReport1().then((result) => print(result));
}

Future<String> generateReport2() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Report generated!';
}

void task6_3() async {
  var result = await generateReport2();
  print(result);
}

Future<int> fetchUserId() async {
  await Future.delayed(Duration(seconds: 1));
  return 123;
}

Future<String> fetchUserDetails(int userId) async {
  await Future.delayed(Duration(seconds: 1));
  return 'User#$userId Name: Bob';
}

void task6_4() async {
  int id = await fetchUserId();
  String details = await fetchUserDetails(id);
  print(details);
}

Future<String> fetchConfiguration() async {
  await Future.delayed(Duration(seconds: 1));
  return 'config';
}

Future<String> loadResources() async {
  await Future.delayed(Duration(seconds: 2));
  return 'resources';
}

void task6_5() async {
  var results = await Future.wait([fetchConfiguration(), loadResources()]);
  print('Both complete: ${results}');
  print('System Ready');
}

// -----------------------------
// 7. Exceptions
// -----------------------------

void divide(int a, int b) {
  try {
    var result = a ~/ b;
    print('Result: $result');
  } on IntegerDivisionByZeroException {
    print('Error: Cannot divide by zero.');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}

void task7_1() {
  divide(10, 2);
  divide(10, 0);
}

void printElementAt(List list, int index) {
  try {
    print('Element at $index: ${list[index]}');
  } on RangeError {
    print('Error: Invalid index.');
  } catch (e) {
    print('Unexpected error: $e');
  }
}

void task7_2() {
  var arr = [1, 2, 3];
  printElementAt(arr, 1);
  printElementAt(arr, 10);
}

void parseAge(String input) {
  try {
    int age = int.parse(input);
    print('Parsed age: $age');
  } on FormatException {
    print('Error: Input is not a valid number.');
  } catch (e) {
    print('Unexpected error: $e');
  }
}

void task7_3() {
  parseAge('25');
  parseAge('abc');
}

class InvalidInputException implements Exception {
  final String message;
  InvalidInputException(this.message);
  @override
  String toString() => 'InvalidInputException: $message';
}

void processText(String text) {
  if (text.trim().isEmpty) {
    throw InvalidInputException('Input cannot be empty');
  }
  print('Processing: $text');
}

void task7_4() {
  try {
    processText('');
  } on InvalidInputException catch (e) {
    print('Caught custom exception: $e');
  } catch (e) {
    print('Other error: $e');
  }
}

void readFromDatabase() {
  print('Opening database connection...');
  try {
    print('Reading data...');
    throw Exception('Read error');
  } catch (e) {
    print('Caught error: $e');
  } finally {
    print('Database connection closed.');
  }
}

void task7_5() {
  readFromDatabase();
}

// -----------------------------
// MAIN DEMO
// -----------------------------

void main() async {
  // Uncomment tasks to test
  task1_1();
  task1_2();
  task1_3();
  task1_4();
  task1_5();

  task2_1();
  task2_2();
  task2_3();
  task2_4();
  task2_5();

  task3_2();
  task3_3();
  task3_4();
  task3_5();

  task4_2();
  task4_3();
  task4_4();
  task4_5();

  task5_2();
  task5_3();
  task5_4();
  task5_5();

  await task6_1();
  task6_2();
  await task6_3();
  await task6_4();
  await task6_5();

  task7_1();
  task7_2();
  task7_3();
  task7_4();
  task7_5();
}
