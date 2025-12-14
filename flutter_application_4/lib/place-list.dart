import 'package:flutter/material.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: PlaceListContent(), backgroundColor: Colors.white),
    );
  }

  Widget PlaceListContent() {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(16, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Taskbar(),
          SizedBox(height: 16),
          Header(),
          SizedBox(height: 16),
          SearchTool(),
          SizedBox(height: 30),
          Text('Saved Places', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Gallery(),
        ],
      ),
    );
  }

  //Images()
  Widget Taskbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () => {},
          icon: Icon(Icons.notifications_rounded),
        ),
        IconButton(onPressed: () => {}, icon: Icon(Icons.extension)),
      ],
    );
  }

  Widget Header() {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        text: 'Welcome,\n',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: 'Tan Tai',
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Widget SearchTool() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.blue),
        hintText: 'Search',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.5, color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  Widget Gallery() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: //Image.asset('assets/images/image-01.jpg', fit: BoxFit.cover),
            Image.network(
              'https://api.sovaba.travel/uploads/sm_tham_quan_dai_noi_hue_mat_bao_laujpg_1c0aec1789.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: //Image.asset('assets/images/image-02.jpg', fit: BoxFit.cover),
            Image.network(
              'https://afamilycdn.com/k:thumb_w/600/WV8iA0A8EAfajQ9tIqEEPbrc36AeNK/Image/2015/01/anh4-ce192/canh-dep-me-hoac-cua-dat-nuoc-trung-quoc.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: //Image.asset('assets/images/image-03.jpg', fit: BoxFit.cover),
            Image.network(
              'https://lh7-rt.googleusercontent.com/docsz/AD_4nXckt22vJDI7T8HsEsUB-pK3NTOlY4rAOW-Yjjs0o6vbMHmyJ855UJJz2AoxPAKLwoVMFN9Imsa3cduZLOjL0F1sC_p-eO5ux-SDIVSOXwvQ7ZoaW5jIyWUEoX8n7fP1Eg81vm2u?key=nkI2RATtNfrpGIQR8qqFB5D_',
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: //Image.asset('assets/images/image-04.jpg', fit: BoxFit.cover),
            Image.network(
              'https://images2.thanhnien.vn/528068263637045248/2024/8/14/h1-1723609152242109447814.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
