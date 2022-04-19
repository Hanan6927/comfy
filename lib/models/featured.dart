class Featured {
  int? id;
  String? name;
  String? dateCreated;
  String? dateCreatedGmt;
  Null? dateModified;
  Null? dateModifiedGmt;
  String? status;
  bool? featured;
  String? catalogVisiblity;
  String? description;
  String? shortDescription;
  String? sku;
  String? imageUrl;
  String? price;
  String? regularPrice;
  int? prodCategory;
  String? brand;

  Featured(
      {this.id,
      this.name,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.status,
      this.featured,
      this.catalogVisiblity,
      this.description,
      this.shortDescription,
      this.sku,
      this.imageUrl,
      this.price,
      this.regularPrice,
      this.prodCategory,
      this.brand});

  Featured.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    status = json['status'];
    featured = json['featured'];
    catalogVisiblity = json['catalog_visiblity'];
    description = json['description'];
    shortDescription = json['short_description'];
    sku = json['sku'];
    imageUrl = json['image_url'];
    price = json['price'];
    regularPrice = json['regular_price'];
    prodCategory = json['prod_category'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['status'] = this.status;
    data['featured'] = this.featured;
    data['catalog_visiblity'] = this.catalogVisiblity;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['sku'] = this.sku;
    data['image_url'] = this.imageUrl;
    data['price'] = this.price;
    data['regular_price'] = this.regularPrice;
    data['prod_category'] = this.prodCategory;
    data['brand'] = this.brand;
    return data;
  }
}