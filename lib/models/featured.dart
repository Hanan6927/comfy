class Featured {
  int? id;
  String? name;
  String? dateCreated;
  Null? dateModified;
  bool? featured;
  String? catalogVisiblity;
  String? description;
  String? shortDescription;
  String? imageUrl;
  String? price;
  String? regularPrice;
  String? itemType;
  int? prodCategory;
  String? brand;

  Featured(
      {this.id,
      this.name,
      this.dateCreated,
      this.dateModified,
      this.featured,
      this.catalogVisiblity,
      this.description,
      this.shortDescription,
      this.imageUrl,
      this.price,
      this.regularPrice,
      this.itemType,
      this.prodCategory,
      this.brand});

  Featured.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    featured = json['featured'];
    catalogVisiblity = json['catalog_visiblity'];
    description = json['description'];
    shortDescription = json['short_description'];
    imageUrl = json['image_url'];
    price = json['price'];
    regularPrice = json['regular_price'];
    itemType = json['item_type'];
    prodCategory = json['prod_category'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['featured'] = this.featured;
    data['catalog_visiblity'] = this.catalogVisiblity;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['image_url'] = this.imageUrl;
    data['price'] = this.price;
    data['regular_price'] = this.regularPrice;
    data['item_type'] = this.itemType;
    data['prod_category'] = this.prodCategory;
    data['brand'] = this.brand;
    return data;
  }
}