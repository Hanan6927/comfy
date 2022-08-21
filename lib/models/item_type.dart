class ItemType {
  int? id;
  int? size;
  int? color;
  int? quantity;
  int? prod;

  ItemType({this.id, this.size, this.color, this.quantity, this.prod});

  ItemType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    size = json['size'];
    color = json['color'];
    quantity = json['quantity'];
    prod = json['prod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['size'] = this.size;
    data['color'] = this.color;
    data['quantity'] = this.quantity;
    data['prod'] = this.prod;
    return data;
  }
}