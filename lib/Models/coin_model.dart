class Coin {
  String fullName;
  String shortForm;
  String image;
  double price;
  double? holding;
  double? changePercent;
  Coin(
      {required this.fullName,
      required this.shortForm,
      required this.image,
      required this.price,
      this.holding,
      this.changePercent});
}
