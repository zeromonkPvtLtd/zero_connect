import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PostDisplayScreen extends StatefulWidget {
  const PostDisplayScreen({Key? key}) : super(key: key);

  @override
  State<PostDisplayScreen> createState() => _PostDisplayScreenState();
}

class _PostDisplayScreenState extends State<PostDisplayScreen> {
  List<String> imageUrls = [
    'https://www.insidesport.in/wp-content/uploads/2021/04/016_WM37_04102021CG_01753-290270b6e5fecca96e9e57bf0cb1fe50.jpg',
    'https://imgs.search.brave.com/IZojU7PfRbPCArOavEepNV_YqGW8u7kA3pk3GVxPSWc/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93d3cu/dGhlbm9sb2d5LmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAx/Ni8wMS82MDg4MzIu/anBn'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ClipRRect(
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1.0,
              disableCenter: true,
              height: MediaQuery.of(context).size.height * 0.25,
              autoPlay: true,
              scrollDirection: Axis.horizontal,
            ),
            items: imageUrls.map((i) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(i, fit: BoxFit.fill)),
              );
            }).toList(),
          ),
        ),
      ]),
    );
  }
}
