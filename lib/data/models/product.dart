class ProductModel {
  String? name, price, desc, image;
  String? calory, fat, carb, protein;
  var id;

  ProductModel(
      {
        required this.name,
        required this.price,
        this.id,
        required  this.desc,
        required  this.image,
        required  this.calory,
        required  this.fat,
        required  this.carb,
        required  this.protein});

  toJson() {
    return {
      'productName': name,
      'productPrice': price,
      'productId': id,
      'productCarb': carb,
      'productCalory': calory,
      'productFats': fat,
      'productProtein': protein,
      'productImage': image,
      'productDesc': desc
    };
  }
}
