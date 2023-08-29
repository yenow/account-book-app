
abstract class BaseModel {
  Map<String, dynamic> toJson();

  @override
  String toString() {
    return toJson().toString();
  }
}