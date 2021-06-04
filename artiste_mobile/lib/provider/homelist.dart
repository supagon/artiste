class Homelist {
  final String id, title, image, sellerId;
  final int price;
  final bool sellerDonate, isAvailable;

  Homelist(
      {this.id,
      this.title,
      this.image,
      this.sellerId,
      this.price,
      this.isAvailable,
      this.sellerDonate});
}
