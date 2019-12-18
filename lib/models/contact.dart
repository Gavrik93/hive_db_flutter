import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType()
//we need type adapter using hive_generator
class Contact {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int age;

  Contact(this.name, this.age);
}
