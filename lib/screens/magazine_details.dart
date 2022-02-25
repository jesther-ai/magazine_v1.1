import 'package:flutter/material.dart';
import 'package:magazine_v1/providers/dummy_loading.dart';
import 'package:magazine_v1/utilities/hex_color.dart';
import 'package:magazine_v1/widget/magazine_sliver_appbar.dart';
import 'package:provider/provider.dart';

class MagazineDetails extends StatelessWidget {
  const MagazineDetails({Key? key}) : super(key: key);
  static const routeName = '/magazineDetails';
  @override
  Widget build(BuildContext context) {
    DummyLoading dummyloading = Provider.of<DummyLoading>(context, listen: false);
    return MagazineSliverAppBar(
      title: dummyloading.selectedMagazine['title'],
      imageUrl: dummyloading.selectedMagazine['imageUrl'],
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 350),
              Text(
                'boday HEREE',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      footer: Footer(price: dummyloading.selectedMagazine['price']),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    required this.price,
    Key? key,
  }) : super(key: key);
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 65,
            width: 250,
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: HexColor('#3D56F0'),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 40,
                  width: 95,
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  decoration: BoxDecoration(
                    color: HexColor('#5468ff'),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
