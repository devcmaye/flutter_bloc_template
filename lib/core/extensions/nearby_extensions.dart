enum NearbyType { all, agent, center }

extension NearbyTypeExtension on NearbyType {
  String get value {
    switch (this) {
      case NearbyType.all:
        return 'ALL';
      case NearbyType.agent:
        return 'AGENT';
      case NearbyType.center:
        return 'CENTER';
    }
  }
}
