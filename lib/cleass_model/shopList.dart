class ShopList {
  String index;
  String nameTH;
  String nameEN;
  String detailTH;
  String detailEN;

  ShopList(this.index, this.detailEN, this.detailTH, this.nameEN, this.nameTH);

  ShopList.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    nameTH = json['nameTH'];
    nameEN = json['nameEN'];
    detailTH = json['detailTH'];
    detailEN = json['detailEN'];
  }
}
