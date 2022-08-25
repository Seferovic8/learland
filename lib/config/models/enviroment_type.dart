enum EnvironmentType {
  development,
  production,
}

extension EnvironmentTypeExtension on EnvironmentType {
  bool get isDevelopment => this == EnvironmentType.development;
  bool get isProduction => this == EnvironmentType.production;

  String getName() {
    switch (this) {
      case EnvironmentType.development:
        return 'Development';
      case EnvironmentType.production:
        return '';
      default:
        return '';
    }
  }
}