part of flutter_naver_map;

abstract class _NaverMapControlSender {
  /// return :
  ///  true if the camera update was canceled
  Future<bool> updateCamera(NCameraUpdate cameraUpdate);

  Future<void> cancelTransitions(
      {NCameraUpdateReason reason = NCameraUpdateReason.developer});

  Future<NCameraPosition> getCameraPosition();

  Future<NLatLngBounds> getContentBounds({bool withPadding = false});

  Future<List<NLatLng>> getContentRegion({bool withPadding = false});

  Future<NSelectedIndoor?> getSelectedIndoor();

  Future<NLocationOverlay> getLocationOverlay();

  Future<NLatLng> screenLocationToLatLng(NPoint point);

  Future<NPoint> latLngToScreenLocation(NLatLng latLng);

  Future<double> getMeterPerDp({double? latitude, double? zoom});

  Future<bool> isDestroyed();

  Future<List<Pickable>> pickAll(NPoint point, {double radius = 0});

  Future<String> takeSnapshot(
      {bool showControls = true, int compressQuality = 80});

  Future<void> setLocationTrackingMode(NLocationTrackingMode mode);

  Future<NLocationTrackingMode> getLocationTrackingMode();

  Future<void> addOverlay(NAddableOverlay overlay);

  Future<void> addOverlayAll(Set<NAddableOverlay> overlays);

  Future<void> deleteOverlay({required NOverlayType type, required String id});

  Future<void> clearOverlays({NOverlayType? type});

  /*
    --- private methods ---
  */
  void _updateOptions(NaverMapViewOptions options);
}
