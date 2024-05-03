abstract class AppAssets {
  static const images = _Images();
  static const svg = _Svg();
}

class _Images {
  const _Images();

  final String enGlobe = 'assets/icons/en_globe.png';
  final String kzGlobe = 'assets/icons/kz_globe.png';
  final String ruGlobe = 'assets/icons/ru_globe.png';

}

class _Svg {
  const _Svg();
  final String flag = 'assets/icons/flag.svg';
  final String globe = 'assets/icons/globe.svg';
  final String location = 'assets/icons/location.svg';
  final String shoppingCart = 'assets/icons/shopping_cart.svg';
  final String ticket = 'assets/icons/ticket.svg';
  final String timer = 'assets/icons/timer.svg';
  final String arrowRight = 'assets/icons/arrow_right.svg';
}
