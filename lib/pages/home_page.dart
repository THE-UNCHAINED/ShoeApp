import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:get/get.dart';
import 'package:spends_product/controller/home_controller.dart';
import 'package:spends_product/pages/add_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          title: Text(
            "FootWare Admin",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, color: Colors.purple),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: ctrl.productList.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                color: Colors.grey.shade50,
                child: ListTile(
                  title: Text(
                    ctrl.productList[index].name ?? 'NO NAME',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    (ctrl.productList[index].price ?? 0).toString(),
                    maxLines: 2,
                    style: GoogleFonts.poppins(),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      ctrl.deleteProducts(ctrl.productList[index].id ?? '');
                    },
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.purple,
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(() => AddProductPage());
            },
          ),
        ),
      );
    });
  }
}
