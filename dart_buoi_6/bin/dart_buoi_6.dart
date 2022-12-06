import 'package:dart_buoi_6/dart_buoi_6.dart' as dart_buoi_6;
import 'dart:math';

List<Shape> listShapes() {
  return [
    Square(4, 5),
    Square(6, 5),
    Square(7, 5),
    Square(8, 5),
    Square(3, 5),
    Square(2, 5),
    Square(1, 5),
  ].map((e) => e..calcArea()..calcPerimeter()).toList();
}
List<Shape> mixShapes() {
  return [
    Rectangle.create(3, 8),
    Circle.create(6),
    Triangle.create(3, 4, 4),
    Square.create(4, 4)
  ];
}
void main(List<String> arguments) {
  var listShape = listShapes();
  var listArea = listShape.map((e) => e.area).toList();
  var listPerimeter = listShape.map((e) => e.perimeter).toList();
  listArea.sort();
  listPerimeter.sort();
  print('Max area: ${listArea.last}');
  print('Min area: ${listArea.first}');
  print('Max perimeter: ${listPerimeter.last}');
  print('Min perimeter: ${listPerimeter.first}');

  ///bai 2
  final shapes = mixShapes().map((e) => e.area).toList();
  shapes.sort();
  print('Largest area: ${shapes.last}');
  print('Smallest area: ${shapes.first}');
  /* var maxValue = shapes[0].area ?? 0;
  var minValue = shapes[0].area ?? 0;
  for (var i = 0; i < shapes.length; i++) {
    double val = shapes[i].area ?? 0;
    if (val > maxValue) {
      maxValue = val;
    }
    if (val < maxValue) {
      minValue = val;
    }
  }
  print('Largest area: $maxValue');
  print('Smallest area: $minValue');
   */
}

class Shape {
  double? perimeter;
  double? area;
  double pi = 3.14;
  Shape({
    perimeter,
    area,
  });
  void calcPerimeter(){}
  void calcArea(){}
}

class Square extends Shape {
  double edge1;
  double edge2;

  Square(
    this.edge1,
    this.edge2,
  );

  factory Square.create(double edge1, double edge2) => Square(edge1, edge2)..calcArea()..calcPerimeter();

  @override
  calcPerimeter(){
    super.perimeter = (edge1 + edge2) * 2;
    //print('perimeter: $perimeter');
  }

  @override
  calcArea(){
    super.area = (edge1 * edge2);
    //print('area: $area');
  }

  @override
  String toString() => 'Perimeter: $perimeter, Area: $area';

}

class Triangle extends Shape {
  double edge1;
  double edge2;
  double edge3;
  
  Triangle(this.edge1, this.edge2, this.edge3);
  
  factory Triangle.create(double edge1, double edge2, double edge3) => Triangle(edge1, edge2, edge3)..calcArea();

  double perimeterTriangle() => (edge1 + edge2 + edge3) / 2;

  double height() {
    return (2 * sqrt(
      perimeterTriangle()
      *  (perimeterTriangle() - edge1)
      * (perimeterTriangle() - edge2)
      * (perimeterTriangle() - edge3)
    )) / edge1;
  } 

  @override
  void calcArea() {
    area = sqrt(
      height()
      * (height() - edge1)
      * (height() - edge2)
      * (height() - edge3)
    );
  }
}
class Circle extends Shape {

  double radius;
  
  Circle(this.radius);
  factory Circle.create(double radius) => Circle(radius)..calcArea();

  @override
  void calcArea() {
    area = radius * radius * pi;
  }

}
class Rectangle extends Shape {
  double edge1;
  double edge2;

  Rectangle(this.edge1, this.edge2);

  factory Rectangle.create(double edge1, double edge2) => Rectangle(edge1, edge2)..calcArea();

  @override
  void calcArea() {
    area = edge1 * edge2;
  }
}