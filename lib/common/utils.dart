String formatPrice(double price,
    {int decimalPlaces = 2, String currencySymbol = '¥'}) {
  String formattedPrice = price.toStringAsFixed(decimalPlaces);
  return '$currencySymbol$formattedPrice';
}
