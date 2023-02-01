part of flutter_naver_map;

abstract class NaverMapSdk {
  static final NaverMapSdk instance = _NaverMapSdkImpl();

  bool get _isInitialized;

  int? get _androidSdkVersion;

  Function(NAuthFailedException ex)? get onAuthFailed;

  Future<void> initialize({
    String? clientId,
    bool gov = false,
    Function(NAuthFailedException ex)? onAuthFailed,
  });
}

class NAuthFailedException implements Exception {
  final String code;
  final String? message;

  NAuthFailedException._(this.code, this.message);

  @override
  String toString() => "AuthFailedException(code: $code, message: $message)";
}
