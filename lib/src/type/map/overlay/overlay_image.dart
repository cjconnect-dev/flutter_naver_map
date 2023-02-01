part of flutter_naver_map;

class NOverlayImage implements NMessageable {
  final String path;
  final _NOverlayImageMode _mode;

  const NOverlayImage._({
    required this.path,
    required _NOverlayImageMode mode,
  }) : _mode = mode;

  const NOverlayImage.fromAssetImage(String assetName)
      : path = assetName,
        _mode = _NOverlayImageMode.asset;

  NOverlayImage.fromFile(File file)
      : path = file.path,
        _mode = _NOverlayImageMode.file;

  static Future<NOverlayImage> fromByteArray(Uint8List imageBytes) async {
    final path = await ImageUtil.saveImage(imageBytes);
    return NOverlayImage._(path: path, mode: _NOverlayImageMode.temp);
  }

  static Future<NOverlayImage> fromWidget({
    required Widget widget,
    required NSize size,
    required BuildContext context,
  }) async {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final imageBytes = await WidgetToImageUtil.widgetToImageByte(widget, size: size, pixelRatio: pixelRatio);
    return NOverlayImage.fromByteArray(imageBytes);
  }

  factory NOverlayImage._fromJson(dynamic json) => NOverlayImage._(
        path: json["path"],
        mode: _NOverlayImageMode._fromJson(json["mode"]),
      );

  @override
  NPayload toNPayload() => NPayload.make({
        "path": path,
        "mode": _mode,
      });
}
