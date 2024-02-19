import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spends_product/controller/home_controller.dart';
import 'package:spends_product/widgets/dropDownButton.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  @override
  String? selectedValue;

  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Product",
            style: GoogleFonts.poppins(color: Colors.purple),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  TextField(
                    controller: ctrl.productNameCtrl,
                    // controller: _textController,
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the value for the desired roundness
                      ),
                    ),
                    onChanged: (value) {
                      // Do something with the entered text
                    },
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: ctrl.productDescriptionCtrl,
                    // controller: _textController,
                    decoration: InputDecoration(
                      labelText: 'Product Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    maxLines: 5,
                    onChanged: (value) {
                      // Do something with the entered text
                    },
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: ctrl.productImgCtrl,
                    // controller: _textController,
                    decoration: InputDecoration(
                      labelText: 'Image to Url',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the value for the desired roundness
                      ),
                    ),
                    onChanged: (value) {
                      // Do something with the entered text
                    },
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    // controller: _textController,
                    controller: ctrl.productPriceCtrl,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the value for the desired roundness
                      ),
                    ),
                    onChanged: (value) {
                      // Do something with the entered text
                    },
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                              child: DropDownButtonWidgets(
                            items: ['Cat1', 'Cat2', 'Cat3'],
                            selectedItemsText: ctrl.category,
                            onSelected: (selectedValue) {
                              ctrl.category = selectedValue ?? 'General';
                              ctrl.update();
                            },
                          )),
                          Flexible(
                              child: DropDownButtonWidgets(
                            items: ['Brand1', 'Brand2', 'Brand3'],
                            selectedItemsText: ctrl.brand,
                            onSelected: (selectedValue) {
                              ctrl.brand = selectedValue ?? 'Brand';
                              ctrl.update();
                            },
                          )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "Offer Products? ",
                            style: GoogleFonts.poppins(color: Colors.black45),
                          ),
                        ),
                      ),
                      DropDownButtonWidgets(
                        items: ['true', 'false'],
                        selectedItemsText: ctrl.offer.toString(),
                        onSelected: (selectedValue) {
                          ctrl.offer =
                              bool.tryParse(selectedValue.toString()) ?? false;
                          ctrl.update();
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple),
                        onPressed: () {
                          ctrl.addProducts();
                          ctrl.fetchProducts();
                        },
                        child: Text(
                          "Add Product",
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
