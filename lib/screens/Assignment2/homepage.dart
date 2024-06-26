import 'package:flutter/material.dart';
import 'package:solulab1/utils/app_text_field.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // const BgImage(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 31.0),
                      ),
                      assign2TextField(
                        text: "Find Your\nFavorite Food",
                        fontFamily: 'Bentonsans_Bold',
                        fontSize: 31.0,
                        color: Color(0xFF22242E),
                      ),
                      SizedBox(width: 27.0),
                      Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                              'assets/images/notification_icon.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.0),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25.0),
                      ),
                      Container(
                        width: 267.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xffEEECFC),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.search, color: Color(0xff6B50F6)),
                            hintText: 'What do you want to order?',
                            hintStyle: TextStyle(color: Color(0xffBBAEFB)),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 15.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 9.0,
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xffEEECFC),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/filter_icon.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/promo_advertising.png'),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 31.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        assign2TextField(
                            text: 'Nearest Restaurant',
                            fontFamily: 'Bentonsans_Bold',
                            fontSize: 15.0),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "View More",
                            style: TextStyle(
                                color: Color(0xFF6B50F6),
                                fontFamily: 'Bentonsans_Book',
                                fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BottomNavigationBar(
                    backgroundColor: Colors.blueGrey,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart),
                        label: 'Cart',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.chat_bubble_outline),
                        label: 'Notification',
                      ),
                    ],
                    selectedItemColor: Color(0xFF6B50F6),
                    onTap: (int index) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
