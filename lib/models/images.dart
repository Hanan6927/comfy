class Images {
  int? id;
  String? src;
  String? name;
  int? comfyProduct;

  Images({this.id, this.src, this.name, this.comfyProduct});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    src = json['src'];
    name = json['name'];
    comfyProduct = json['comfy_product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['src'] = this.src;
    data['name'] = this.name;
    data['comfy_product'] = this.comfyProduct;
    return data;
  }
}