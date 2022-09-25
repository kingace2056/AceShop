import 'dart:io';
import 'dart:ui';

import 'package:aceshop/constraints/catrgories_temp.dart';
import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/constraints/utils.dart';
import 'package:aceshop/models/services/admin/admin_services.dart';
import 'package:aceshop/views/widgets/custom_text_field.dart';
import 'package:aceshop/views/widgets/loader.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddProductScr extends StatefulWidget {
  const AddProductScr({super.key});

  @override
  State<AddProductScr> createState() => _AddProductScrState();
}

class _AddProductScrState extends State<AddProductScr> {
  final TextEditingController pnameController = TextEditingController();
  final TextEditingController pdesController = TextEditingController();
  final TextEditingController pPriceController = TextEditingController();
  final TextEditingController pQuanController = TextEditingController();
  final AdminServices adminServices = AdminServices();
  final _addProdFormKey = GlobalKey<FormState>();

  String category = 'Foods';

  List<String> categories =
      categoryTemp.entries.map<String>((e) => e.key).toList();

  // List<String> categories = [
  //   'Foods',
  //   'Gift',
  //   'Fashion',
  //   'Sports',
  //   'Lifestyle',
  //   'Gadget',
  //   'Electronics',
  //   'Souvenir'
  // ];
  List<File> images = [];

  void selectImage() async {
    var result = await pickImages();
    setState(() {
      images = result;
    });
  }

  void postProduct() {
    if (_addProdFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          name: pnameController.text,
          description: pdesController.text,
          price: double.parse(pPriceController.text),
          quantity: double.parse(pQuanController.text),
          category: category,
          images: images);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pnameController.dispose();
    pdesController.dispose();
    pPriceController.dispose();
    pQuanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: defpad,
              child: images.isNotEmpty
                  ? CarouselSlider.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(images[index]))),
                        );
                      },
                      options: CarouselOptions(),
                      // options: opt,
                    )
                  : InkWell(
                      onTap: () {
                        print(categories);
                        print(categoryTemp);
                        selectImage();
                      },
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        padding: defpad,
                        radius: Radius.circular(20),
                        color: primaryBlk,
                        strokeWidth: 2,
                        dashPattern: [10, 10],
                        child: Container(
                          padding: defpad,
                          // margin: defpad,
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.25,
                          color: labelBlue,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.folderClosed,
                                  color: primaryBlk,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Select Prduct Images',
                                  style: TextStyle(
                                      color: secDarkGrey, fontSize: 20),
                                )
                              ]),
                        ),
                      ),
                    ),
            ),
            Padding(
              padding: defpad,
              child: Form(
                  key: _addProdFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(
                        pdesController: pnameController,
                        hint: 'Enter Product name',
                        label: 'Product name',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        pdesController: pdesController,
                        hint: 'Enter product description ',
                        label: 'Descriptions',
                        maxLine: 6,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          pdesController: pPriceController,
                          inputType: TextInputType.number,
                          hint: '30000',
                          label: 'Price'),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          pdesController: pQuanController,
                          inputType: TextInputType.number,
                          hint: '3',
                          label: 'Quantity'),
                      SizedBox(
                        height: 20,
                      ),
                      // DropdownButtonFormField(
                      //     value: category,
                      //     icon: const Icon(FontAwesomeIcons.arrowDown),
                      //     items: categories.map((String item) {
                      //       return DropdownMenuItem(
                      //         value: item,
                      //         child: Text(item),
                      //       );
                      //     }).toList(),
                      //     onChanged: (String? newVal) {
                      //       setState(() {
                      //         category = newVal!;
                      //       });
                      //     }),
                      Container(
                        padding: defpad,
                        width: double.infinity,
                        child: DropdownButton(
                          underline: const SizedBox(),
                          value: category,
                          icon: const Icon(FontAwesomeIcons.arrowDown),
                          items: categories.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newVal) {
                            setState(() {
                              category = newVal!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: defpad,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primary,
                              foregroundColor: primaryWhite),
                          onPressed: () {
                            postProduct();
                            print('posted');
                          },
                          child: Text('Submit'),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
