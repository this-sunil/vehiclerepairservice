enum Flavor {
  development,
  staging,
  production,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return 'Vehicle Repair Service Dev';
      case Flavor.staging:
        return 'Vehicle Repair Service Staging';
      case Flavor.production:
        return 'Vehicle Repair Service';
    }
  }

}
