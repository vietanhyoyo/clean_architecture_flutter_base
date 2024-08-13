import 'package:clean_architecture/features/daily_news/domain/entities/source.dart';

class SourceModel extends SourceEntity {
  const SourceModel({
    super.id,
    super.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> map) {
    return SourceModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
    );
  }
}
