class Homelist {
  final String id, title, image, sellerId, displayName;
  final int price;
  final bool sellerDonate, isAvailable;

  Homelist(
      {this.displayName,
      this.id,
      this.title,
      this.image,
      this.sellerId,
      this.price,
      this.isAvailable,
      this.sellerDonate});
}
