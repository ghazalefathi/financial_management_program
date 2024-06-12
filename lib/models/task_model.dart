import 'package:hive/hive.dart';
part 'task_model.g.dart';
@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? txt;
  @HiveField(3)
  bool? isCheck;
  TaskModel({
    this.id,
    this.title,
    this.txt,
    this.isCheck,
  });
}
