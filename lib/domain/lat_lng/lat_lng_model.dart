import 'package:hive/hive.dart';

part 'lat_lng_model.g.dart';

@HiveType(typeId: 0)
class LatLngData {
  @HiveField(0)
  final double latitude;

  @HiveField(1)
  final double longitude;

  LatLngData(this.latitude, this.longitude);
}
