class ProductModel {
  String? id;
  String? title;
  String? type;
  String? image;
  int? price;
  int? basePrice;
  String? category;
  String? subCategory;
  String? description;
  String? publisherId;
  String? size;
  String? color;
  List<String>? tags;
  String? rating;
  String? voucher;
  bool? isLiked;
  bool? inCart;
  bool? visible;

  ProductModel(
      {this.id,
      this.title,
      this.type,
      this.image,
      this.price,
      this.basePrice,
      this.category,
      this.subCategory,
      this.description,
      this.publisherId,
      this.size,
      this.color,
      this.tags,
      this.rating,
      this.voucher,
      this.isLiked,
      this.inCart,
      this.visible});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    image = json['image'];
    price = json['price'];
    basePrice = json['basePrice'];
    category = json['category'];
    subCategory = json['subCategory'];
    description = json['description'];
    publisherId = json['publisherId'];
    size = json['size'];
    color = json['color'];
    tags = json['tags'].cast<String>();
    rating = json['rating'];
    voucher = json['voucher'];
    isLiked = json['isLiked'];
    inCart = json['inCart'];
    visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['image'] = this.image;
    data['price'] = this.price;
    data['basePrice'] = this.basePrice;
    data['category'] = this.category;
    data['subCategory'] = this.subCategory;
    data['description'] = this.description;
    data['publisherId'] = this.publisherId;
    data['size'] = this.size;
    data['color'] = this.color;
    data['tags'] = this.tags;
    data['rating'] = this.rating;
    data['voucher'] = this.voucher;
    data['isLiked'] = this.isLiked;
    data['inCart'] = this.inCart;
    data['visible'] = this.visible;
    return data;
  }
}
