import 'package:flutter/material.dart';
import 'package:ngekost/model/space.dart';
import 'package:ngekost/model/tips.dart';
import 'package:ngekost/providers/space_provider.dart';
import 'package:ngekost/theme.dart';
import 'package:ngekost/widgets/bottom_navbar.dart';
import 'package:ngekost/widgets/city_card.dart';
import 'package:ngekost/widgets/space_card.dart';
import 'package:ngekost/widgets/tips_card.dart';
import 'package:provider/provider.dart';

import '../model/city.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    spaceProvider.getRecommendedSpaces();

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            // NOTE: HEADER => TITLE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Cari Sekarang',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Cari kost yang aman dan nyaman',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: FAVORITE CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Kota',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: edge,
                  ),
                  CityCard(City(
                    id: 1,
                    name: 'Jakarta',
                    imageUrl: 'assets/city1.png',
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                    id: 2,
                    name: 'Bandung',
                    imageUrl: 'assets/city2.png',
                    isPopular: true,
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                    id: 3,
                    name: 'Surabaya',
                    imageUrl: 'assets/city3.png',
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                      id: 4, 
                      name: 'Palembang', 
                      imageUrl: 'assets/city4.jpg')),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                      City(id: 5, 
                      name: 'Aceh', 
                      imageUrl: 'assets/city5.jpg',)),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                      City(id: 6, 
                      name: 'bogor', 
                      imageUrl: 'assets/city6.jpg', 
                       isPopular: true,)),
                  SizedBox(
                    width: edge,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: RECOMENDED SPACE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Rekomendasi',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;

                    int index = 0;

                    return Column(
                        children: data.map((item) {
                      index++;
                      return Container(
                        margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                        child: SpaceCard(item),
                      );
                    }).toList());
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),

            SizedBox(
              height: 30,
            ),
            // NOTE: TIPS & GUIDANCE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Panduan & Persyaratan ',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TipsCard(Tips(
                      id: 1,
                      title: 'Panduan',
                      imageUrl: 'assets/tipe1.png',
                      updatedAt: '22 Agustus 2022')),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(Tips(
                      id: 2,
                      title: 'Persyaratan',
                      imageUrl: 'assets/tipe2.png',
                      updatedAt: '30 Agustus 2022')),
                ],
              ),
            ),
            SizedBox(
              height: 50 + edge,
            ),
            //NOTE: BOTTOM NAVBAR
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/ic_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/ic_mail.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/ic_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/ic_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
