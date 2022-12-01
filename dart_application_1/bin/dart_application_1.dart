import 'package:dart_application_1/dart_application_1.dart' as dart_application_1;

/* 
Bài tập 1:
Cho 1 mảng distances = [1,3,10,4,2,6,7,8,4,2,1];
Viết hàm:
- Tìm giá trị lớn nhất, nhỏ nhất trong mảng, vị trí(đầu tiên nếu trùng).
- Tính tổng giá trị các phần tử của mảng.
Bài tập 2:
cho map: 
{
‘name’: ‘Hoang’,
‘age’: 23,
‘job’: ‘IT’
}

- Hiển thị ra màn hình:  HOANG-23-IT.
- Thêm thông tin cho map: ‘email’: ‘abc@gmail.com’
 */
void main(List<String> arguments) {
  //print('Hello world: ${dart_application_1.calculate()}!');
  final distances = [1,3,10,4,2,6,7,8,4,2,1];
  var sum      = 0,
      maxIndex = 0,
      minIndex = 0;
  for(int i = 0; i < distances.length; i++) {
    if(distances[maxIndex] < distances[i]) {
      maxIndex = i;
    }
    if(distances[minIndex] > distances[i]) {
      minIndex = i;
    }
    sum += distances[i];
  }
  print('Giá trị lớn nhất: ${distances[maxIndex]} tại index: $maxIndex');
  print('Giá trị nhỏ nhất: ${distances[minIndex]} tại index: $minIndex');
  print('Tổng giá trị các phần tử: $sum');

  ///########## Bài tập 2: #########
  Map<String, dynamic> info = {
  'name': 'Hoang',
  'age': 23,
  'job': 'IT'
  };
  String str = [
    info['name'].toUpperCase(),
    info['age'].toString().toUpperCase(),
    info['job'].toUpperCase(),
  ].join('-');

  //- Hiển thị ra màn hình:  HOANG-23-IT.
  print(str);

  //- Thêm thông tin cho map: ‘email’: ‘abc@gmail.com’
  info['email'] = 'abc@gmail.com';
  print(info);
}
