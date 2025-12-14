import 'package:flutter/material.dart';
import 'villa.dart';

class Villas extends StatelessWidget {
  const Villas({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: VillaList(), backgroundColor: Colors.white),
    );
  }

  Widget VillaList() {
    return Column(children: [Statebar(), Taskbar(), VillaInformationList()]);
  }

  Widget Statebar() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
      decoration: BoxDecoration(color: Colors.blueAccent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          ),
          Text(
            'Xung quanh vị trí hiện tại',
            style: TextStyle(color: Colors.white),
          ),
          Text('23 thg 10 - 24 thg 10', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget Taskbar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0.5,
            blurRadius: 20,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OutlinedButton.icon(
            onPressed: () => {},
            style: OutlinedButton.styleFrom(
              side: BorderSide.none,
              foregroundColor: Colors.black,
            ),
            icon: Icon(Icons.import_export_rounded),
            label: Text('Sắp xếp'),
          ),
          OutlinedButton.icon(
            onPressed: () => {},
            style: OutlinedButton.styleFrom(
              side: BorderSide.none,
              foregroundColor: Colors.black,
            ),
            icon: Icon(Icons.tune_rounded),
            label: Text('Lọc'),
          ),
          OutlinedButton.icon(
            onPressed: () => {},
            style: OutlinedButton.styleFrom(
              side: BorderSide.none,
              foregroundColor: Colors.black,
            ),
            icon: Icon(Icons.map_outlined),
            label: Text('Bản đồ'),
          ),
        ],
      ),
    );
  }

  Widget VillaInformationList() {
    List<Villa> villas = [
      Villa(
        'aNhill Boutique',
        'https://cdn.pixabay.com/photo/2014/11/19/15/36/villa-borghese-537944_1280.jpg',
        true,
        5,
        9.5,
        95,
        'Huế',
        0.6,
        '1 suite riêng tư',
        '1 giường',
        109,
        true,
      ),
      Villa(
        'An Nam Hue Boutique',
        'https://cdn.pixabay.com/photo/2018/09/11/21/10/villa-balbianello-3670650_1280.jpg',
        true,
        null,
        9.2,
        34,
        'Cư Chinh',
        0.9,
        '1 phòng khách sạn',
        '1 giường',
        20,
        true,
      ),
      Villa(
        'Huế Jade Hill Villa',
        'https://cdn.pixabay.com/photo/2019/05/03/15/32/villa-taranto-4176145_1280.jpg',
        false,
        null,
        8.0,
        1,
        'Cư Chinh',
        1.3,
        '1 biệt thự nguyên căn - 1.000m2',
        '4 giường - 3 phòng ngủ - 1 phòng khách - 3 phòng tắm',
        285,
        true,
      ),
      Villa(
        'Êm Villa',
        'https://cdn.pixabay.com/photo/2018/03/21/17/46/biarritz-3247556_1280.jpg',
        true,
        null,
        7.6,
        5,
        'Phú Lộc',
        2.2,
        '1 nhà nghỉ nguyên căn',
        '3 phòng - 3 nhà tắm - 1 phòng khách - 1 phòng giải trí',
        240,
        true,
      ),
    ];

    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(12, 12, 12, 0),
            child: Row(children: [Text('${villas.length} chỗ nghỉ')]),
          ),
          for (int i = 0; i < villas.length; i++) VillaInformation(villas[i]),
        ],
      ),
    );
  }

  Widget VillaInformation(Villa villa) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
            child: Stack(
              children: [
                Image.network(
                  villa.image as String,
                  width: 135,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                if (villa.isIncludeBreakfast == true)
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      color: Colors.green,
                      child: Text(
                        'Bao bữa sáng',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${villa.villaName}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          if (villa.serviceLevel != null)
                            Row(
                              children: [
                                for (int j = 0; j < villa.serviceLevel!; j++)
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.amber,
                                  ),
                              ],
                            ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => {},
                        icon: Icon(Icons.heart_broken_outlined),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          '${villa.feedbackScore}',
                          style: TextStyle(color: Colors.white),
                        ),
                        width: 25,
                        height: 25,
                        alignment: AlignmentGeometry.xy(0, 0),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(4),
                          ),
                        ),
                      ),
                      Text(' - ${villa.feedbackQuantity} đánh giá'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.pin_drop_outlined),
                      Text('${villa.location} - Cách bạn ${villa.distance}km'),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
                          textAlign: TextAlign.end,
                          text: TextSpan(
                            text: '${villa.description}: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: '${villa.detailDescription}',
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'US\$${villa.price}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        if (villa.isIncludeFee == true)
                          Text('Đã bao gồm thuế và phí'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
