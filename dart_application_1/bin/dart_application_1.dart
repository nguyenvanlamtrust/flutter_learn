import 'package:dart_application_1/dart_application_1.dart' as dart_application_1;
/* 
1 - Khai báo lớp Person với các thuộc tính: name(String), age(int), email(String?), các phương thức: showName(), showAge().
2 - Khai báo lơp Student kế thừa lớp person, thêm các thuộc tính: grade(int), className(String), mark(int). Phương thức showMarkPoint().
3 - Khai báo lớp Teacher kế thừa lớp person, thêm các thuộc tính: department(String), subject(String). Phương thức: teach().
4- Tạo constructor cho các lớp ở trên.
Note: Các phương thức chỉ cần khai báo, k cần viết nội dung thực thi bên trong
 */

class Person {
  String name;
  int age;
  String? email;
  Person({
    required this.name,
    required this.age,
    String? email,
  });
  void showName(){}
  void showAge(){}

}

class Student extends Person {
  int grade;
  String className;
  int mark;

  Student({
    required name,
    required age,
    required this.grade,
    required this.className,
    required this.mark,
    String? email,
  }) : super(name: name, age: age, email: email);
  void showMarkPoint(){}
}

class Teacher extends Person {
  String department;
  String subject;
  Teacher({
    required super.name,
    required super.age,
    required this.department,
    required this.subject,
    String? email,
  });
  void teach() {}
}

void main(List<String> arguments) {
  
}