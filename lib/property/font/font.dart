class FontFamily{
  const FontFamily._(this.index, this.value);

  final int index;

  final String value;

  static const lato = FontFamily._(0, "Lato");
  static const roboto = FontFamily._(1, 'Roboto');
  static const openSans = FontFamily._(2, 'Open Sans');
  static const montserrat = FontFamily._(3, 'Montserrat');
  static const oswald = FontFamily._(4, 'Oswald');
  static const raleway = FontFamily._(5, 'Raleway');
  static const notoSans = FontFamily._(6, 'Noto Sans');
  static const poppins = FontFamily._(7, 'Poppins');
  static const sourceSansPro = FontFamily._(8, 'Source Sans Pro');
  static const ubuntu = FontFamily._(9, 'Ubuntu');
  static const merriweather = FontFamily._(10, 'Merriweather');
  static const workSans = FontFamily._(11, 'Work Sans');
  static const robotoCondensed = FontFamily._(12, 'Roboto Condensed');
  static const ptSans = FontFamily._(13, 'PT Sans');
  static const droidSans = FontFamily._(14, 'Droid Sans');
  static const playfairDisplay = FontFamily._(15, 'Playfair Display');
  static const comfortaa = FontFamily._(16, 'Comfortaa');
  static const exo = FontFamily._(17, 'Exo');
  static const inconsolata = FontFamily._(18, 'Inconsolata');
  static const quicksand = FontFamily._(19, 'Quicksand');
}