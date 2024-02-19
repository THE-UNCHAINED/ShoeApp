import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spends_product/model/product/product.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

  // late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = "General";
  String brand = "UN branded";
  bool offer = false;

  List<Product> productList = [];

  @override
  void onInit() async {
    productCollection = firestore.collection('products');
    await fetchProducts();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> addProducts() async {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescriptionCtrl.text,
        price: double.tryParse(productPriceCtrl.text),
        brand: brand,
        image: productImgCtrl.text,
        offer: offer,
      );
      final productJson = product.toJson();

      await doc.set(productJson);
      Get.snackbar("SUCCESS", 'data has been added', colorText: Colors.green);
      setControllerDefault();
    } catch (e) {
      Get.snackbar("Failure", e.toString(), colorText: Colors.red);

      print(e);
    }
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();

      // very special method to convert all document type data to Map and then convert that map to list so that we can accces tha

      final List<Product> retrieveProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      productList.clear();
      productList.assignAll(retrieveProducts);
      Get.snackbar("SUCCESS", "The data has been arrived",
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar(
        "Failure",
        "The data has'nt been arrived",
        colorText: Colors.red,
      );

      print(e);
    } finally {
      update();
    }
  }

  deleteProducts(String id) async {
    try {
      await productCollection.doc(id).delete();
      Get.snackbar("Deleted", "data removed", colorText: Colors.red);

      fetchProducts();
    } catch (e) {
      Get.snackbar("Failure", "The data has'nt been arrived");
      print(e);
    } finally {
      update();
    }
  }

  setControllerDefault() {
    productImgCtrl.clear();
    productPriceCtrl.clear();
    productDescriptionCtrl.clear();
    productNameCtrl.clear();

    category = "General";
    brand = "UN branded";
    offer = false;
    update();
  }
}
