import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market_hub/src/constants/colors.dart';
import 'package:market_hub/src/constants/sizes.dart';
import 'package:market_hub/src/features/authentication/screens/vendor_dashboard_screen/widgets/drawer_vendor.dart';

class VendorUploadProductScreen extends StatefulWidget {
  const VendorUploadProductScreen({super.key});

  @override
  State<VendorUploadProductScreen> createState() =>
      _VendorUploadProductScreenState();
}

class _VendorUploadProductScreenState extends State<VendorUploadProductScreen> {
  final productNameController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final productPriceController = TextEditingController();

  final CollectionReference _items =
      FirebaseFirestore.instance.collection('Products_Items');

  String imageUrl = '';
  File? _selectedImage;

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Center(
                      child: Text(
                        'Add Product',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    TextFormField(
                      controller: productNameController,
                      decoration:
                          const InputDecoration(labelText: 'Product Name'),
                    ),
                    const SizedBox(
                      height: marketHubDefaultSize - 20,
                    ),
                    TextFormField(
                      controller: productDescriptionController,
                      decoration: const InputDecoration(
                          labelText: 'Product Description'),
                    ),
                    const SizedBox(
                      height: marketHubDefaultSize - 20,
                    ),
                    TextFormField(
                      controller: productPriceController,
                      decoration: const InputDecoration(labelText: 'Price'),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: marketHubDefaultSize - 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: Center(
                                  child: _selectedImage != null
                                      ? Image.file(_selectedImage!)
                                      : const Text('No Image Selected'),
                                ),
                              ),
                              MaterialButton(
                                color: Colors.grey,
                                onPressed: () async {
                                  final file = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (file == null) return;
                                  setState(() {
                                    _selectedImage = File(file.path);
                                  });

                                  String fileName = DateTime.now()
                                      .microsecondsSinceEpoch
                                      .toString();

                                  // Getting the reference to storage root
                                  Reference referenceRoot =
                                      FirebaseStorage.instance.ref();
                                  Reference referenceDireImages =
                                      referenceRoot.child('productImages');

                                  Reference referenceImageToUpload =
                                      referenceDireImages.child(fileName);

                                  try {
                                    await referenceImageToUpload
                                        .putFile(File(file.path));
                                    // Getting uploaded image link in firebase database
                                    imageUrl = await referenceImageToUpload
                                        .getDownloadURL();
                                  } catch (error) {
                                    // some error
                                  }
                                },
                                child: const Text('Choose a Image'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: marketHubDefaultSize - 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (imageUrl.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please Select and upload image'),
                              ),
                            );
                          }
                          final String productName = productNameController.text;
                          final String productDescription =
                              productDescriptionController.text;
                          final int? productPrice =
                              int.tryParse(productPriceController.text);

                          if (productPrice != null) {
                            await _items.add({
                              'productId': _items.id,
                              'productName': productName,
                              'productDescription': productDescription,
                              'productPrice': productPrice,
                              'productImage': imageUrl,
                            });
                            Get.snackbar(
                                "Product added Successfully", "to your store.",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white);
                            productNameController.text = '';
                            productDescriptionController.text = '';
                            productPriceController.text = '';
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text(
                          'Add Product',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  late Stream<QuerySnapshot> _stream;
  @override
  void initState() {
    super.initState();
    _stream =
        FirebaseFirestore.instance.collection('Products_Items').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upload Product',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        backgroundColor: marketHubPrimaryColor,
      ),
      drawer: const DrawerVendor(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: marketHubPrimaryColor,
        onPressed: () {
          _create();
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Some error occured${snapshot.error}',
              ),
            );
          }
          // Checking if data arrived
          if (snapshot.hasData) {
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> document = querySnapshot.docs;

            // we need to convert documents to Map to display
            List<Map> items = document.map((e) => e.data() as Map).toList();

            // displaying the list of item
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  Map thisItems = items[index];
                  return ListTile(
                    title: Text(
                      '${thisItems['productName']}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Rs.${thisItems['productPrice']}',
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    leading: CircleAvatar(
                      radius: 27,
                      child: thisItems.containsKey('productImage')
                          ? ClipOval(
                              child: Image.network(
                                '${thisItems['productImage']}',
                                fit: BoxFit.cover,
                                height: 70,
                                width: 70,
                              ),
                            )
                          : const CircleAvatar(),
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
