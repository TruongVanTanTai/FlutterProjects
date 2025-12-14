import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Information());
  }

  Widget Information() {
    return ListView(
      children: [
        block1(),
        block2(),
        block3(),
        block4(),
        // Image.asset("assets/images/castle.png"),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           "Oeschinen Lake Campground",
        //           style: TextStyle(fontWeight: FontWeight.bold),
        //         ),

        //         Text(
        //           "Kandersteg, Switzerland",
        //           style: TextStyle(color: Colors.grey, fontSize: 16),
        //         ),
        //       ],
        //     ),

        //     Row(
        //       children: [
        //         Icon(Icons.star, color: Colors.red),
        //         Text("41", style: TextStyle(fontSize: 14, color: Colors.black)),
        //       ],
        //     ),
        //   ],
        // ),

        // Row(
        //   children: [
        //     Column(
        //       children: [
        //         Icon(Icons.call, color: Colors.blue),
        //         Text("TEXT", style: TextStyle(color: Colors.blue)),
        //       ],
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Widget block1() {
    //var image = "assets/images/castle.png";
    return Image.network(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Panor%C3%A1mica_Oto%C3%B1o_Alc%C3%A1zar_de_Segovia.jpg/500px-Panor%C3%A1mica_Oto%C3%B1o_Alc%C3%A1zar_de_Segovia.jpg',
    );
  }

  Widget block2() {
    var title = "Desert Castle";
    var subtitle = "Desert castle in Germany";

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.red),
              Text("41"),
            ],
          ),
        ],
      ),
    );
  }

  Widget block3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.call, color: Colors.blue),
            Text("CALL", style: TextStyle(color: Colors.blue)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.route, color: Colors.blue),
            Text("ROUTE", style: TextStyle(color: Colors.blue)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.share, color: Colors.blue),
            Text("SHARE", style: TextStyle(color: Colors.blue)),
          ],
        ),
      ],
    );
  }

  Widget block4() {
    var description =
        "Rising from the golden sands like a mirage, the desert castle stands as a testament to resilience and ancient craftsmanship. Its sun-baked stone walls, weathered by centuries of scorching heat and windblown grit, shelter secrets of long-lost dynasties and forgotten travelers. Turrets and towers, once used to spot distant caravans, now cast long shadows over the silent dunes. Inside, cool courtyards and arched halls offer refuge from the relentless sun, adorned with faded mosaics and intricate carvings that whisper tales of power, trade, and survival. Surrounded by the vast, unforgiving wilderness, the desert castle remains a solitary guardian of history—stoic, mysterious, and enduring.";
    return Padding(padding: const EdgeInsets.all(20), child: Text(description));
  }
}
