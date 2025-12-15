import 'package:flutter/material.dart';
import 'package:flutter_application_8/API.dart';
import 'package:flutter_application_8/model/product.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  late API api;
  late Future<List<Product>?> products;

  @override
  void initState() {
    super.initState();
    api = API();
    products = api.getAllProduct();
  }

  getAllProducts() {
    setState(() {
      products = api.getAllProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: ProductList()));
  }

  Widget ProductList() {
    return Column(children: [Statusbar(), Toolbar(), ListBody()]);
  }

  Widget Statusbar() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.arrow_back_ios_new)),
          Text('TIKTOK SHOP', style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              IconButton(
                onPressed: () => {},
                icon: Icon(Icons.notifications_outlined),
              ),
              //IconButton(onPressed: () => {}, icon: Icon(Icons.share_sharp)),
            ],
          ),
        ],
      ),
    );
  }

  Widget Toolbar() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.vibration)),
          IconButton(
            onPressed: getAllProducts,
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          IconButton(onPressed: () => {}, icon: Icon(Icons.repeat)),
        ],
      ),
    );
  }

  Widget ProductCard(Product product) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.network(product.image, width: 100, height: 120)),
          SizedBox(height: 16),
          Text(
            product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(product.category, maxLines: 2, overflow: TextOverflow.ellipsis),
          Text(
            '${product.price.toString()}\$',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.red,
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color.fromARGB(47, 255, 193, 7),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 5),
                Text(product.rating.rate.toString()),
                Text(
                  ' | ${product.rating.count}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ProductGridView(List<Product>? products) {
    return Container(
      padding: EdgeInsets.all(8),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.6,
        ),
        itemCount: products!.length,
        itemBuilder: (context, index) {
          return ProductCard(products[index]);
        },
      ),
    );
  }

  Widget ListBody() {
    return FutureBuilder(
      future: products,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.data == null) {
            return Center(
              child: Text('Error: Get all products unsuccessfully'),
            );
          }
          if (snapshot.data!.isEmpty) {
            return Center(child: Text('No products exist'));
          }
          return Expanded(child: ProductGridView(snapshot.data));
        } else {
          return Expanded(child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
