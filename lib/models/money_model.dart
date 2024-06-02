import 'package:hive/hive.dart';
part 'money_model.g.dart';
@HiveType(typeId: 0)
class MoneyModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? price;
  @HiveField(3)
  String? date;
  @HiveField(4)
  bool? isReceived;
  MoneyModel({this.date, this.id, this.isReceived, this.price, this.title});
}
