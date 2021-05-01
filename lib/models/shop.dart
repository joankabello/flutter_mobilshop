class ShopItem {
  final String name;
  final String id;
  bool isChecked;

  ShopItem({
    this.id,
    this.name,
    this.isChecked = false,
  });

  static List<ShopItem> fromList(List<dynamic> list) {
    final List<ShopItem> shopItemList = [];

    list.forEach((item) {
      shopItemList.add(
        ShopItem(
          id: item.id,
          name: item["name"],
          isChecked: item["isChecked"],
        ),
      );
    });
    return shopItemList;
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "isChecked": isChecked
    };
  }  
}
