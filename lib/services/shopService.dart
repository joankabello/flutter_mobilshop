import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mobilshop/models/shop.dart';

class ShopService {
  CollectionReference shopCollection =
      FirebaseFirestore.instance.collection("shops");

  Future<List<ShopItem>> getShopItems() async {
    final shopItemsList = await shopCollection.get();
    return ShopItem.fromList(shopItemsList.docs);
  }

  Future<void> addShopItem(String itemName) async {
    await shopCollection.add(
      ShopItem(name: itemName).toJson(),
    );
  }

  Future<void> deleteShopItem(ShopItem shopItem) async {
    await shopCollection.doc(shopItem.id).delete();
  }

  Future<void> updateShopItem(ShopItem shopItem) async {
    await shopCollection.doc(shopItem.id).update(
      shopItem.toJson(),
    );
  }
}
