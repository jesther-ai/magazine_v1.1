import 'package:flutter/material.dart';
import 'package:magazine_v1/providers/dummy_loading.dart';
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
    );
  }
}
