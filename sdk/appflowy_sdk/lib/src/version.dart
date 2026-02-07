/// AppFlowy SDK version information
class SDKVersion {
  /// Current SDK version
  static const String version = '1.0.0-alpha';

  /// Minimum supported AppFlowy Cloud version
  static const String minCloudVersion = '0.5.0';

  /// User-Agent string for HTTP requests
  static String get userAgent => 'AppFlowySDK/$version';

  /// Check if a cloud version is supported
  static bool isCloudVersionSupported(String cloudVersion) {
    // Simple version comparison (can be enhanced later)
    final parts = cloudVersion.split('.');
    final minParts = minCloudVersion.split('.');

    if (parts.isEmpty || minParts.isEmpty) return false;

    try {
      final major = int.parse(parts[0]);
      final minor = parts.length > 1 ? int.parse(parts[1]) : 0;

      final minMajor = int.parse(minParts[0]);
      final minMinor = minParts.length > 1 ? int.parse(minParts[1]) : 0;

      if (major > minMajor) return true;
      if (major == minMajor && minor >= minMinor) return true;

      return false;
    } catch (e) {
      return false;
    }
  }
}
