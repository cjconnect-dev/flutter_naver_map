part of flutter_naver_map;

class NCameraPosition implements NMessageable {
  final NLatLng target;
  final double zoom;
  final double tilt;
  final double bearing;

  const NCameraPosition(
      {required this.target,
      required this.zoom,
      this.tilt = 0,
      this.bearing = 0});

  factory NCameraPosition._fromJson(dynamic map) {
    return NCameraPosition(
      target: NLatLng._fromJson(map["target"]),
      zoom: map["zoom"],
      tilt: map["tilt"],
      bearing: map["bearing"],
    );
  }

  @override
  String toString() => "$runtimeType: ${toNPayload().json}";

  @override
  NPayload toNPayload() => NPayload.make({
        "target": target,
        "zoom": zoom,
        "tilt": tilt,
        "bearing": bearing,
      });
}
