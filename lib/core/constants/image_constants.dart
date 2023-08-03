class ImageConstants {
  static ImageConstants? _instance;

  static ImageConstants get instance => _instance ??= ImageConstants._init();

  ImageConstants._init();

  String get logo => toPng("accredited_mips_logo");
  String get splashLogo => toPng("accredited_mips_logo");

  String toPng(String name) => 'assets/images/$name.png';
  String toSvg(String name) => 'assets/images/$name.svg';
}