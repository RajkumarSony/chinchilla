import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:customer_app/controllers/authController.dart';
import 'package:customer_app/controllers/user_controller.dart';
import 'package:customer_app/services/url_launcher.dart';
import 'package:customer_app/views/screens/side_nav/profile.dart';
import 'package:customer_app/views/screens/side_nav/wallet/wallet.dart';
import 'package:customer_app/views/screens/side_nav/address.dart';
import 'package:customer_app/views/screens/side_nav/contact.dart';
import 'package:customer_app/views/screens/side_nav/developer_info.dart';

final AuthController _authController = Get.find();
final UserController _userController = Get.find();

Widget sideDrawer = Drawer(
  elevation: 5,
  child: ListView(
    children: [
      DrawerHeader(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                'https://avatars.githubusercontent.com/u/39991296?v=4',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            '${_userController.user.value.firstName} ${_userController.user.value.lastName}',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text(
            '(${_userController.user.value.phone})',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w200),
          ),
        ],
      )),
      ListTile(
        leading: Icon(Icons.person),
        title: Text('Profile'),
        onTap: () {
          Get.to(() => ProfileScreen());
        },
      ),
      ListTile(
        leading: Icon(Icons.wallet_giftcard),
        title: Text('Wallet'),
        onTap: () {
          Get.to(() => WalletScreen());
        },
      ),
      ListTile(
        leading: Icon(Icons.location_city),
        title: Text('Addresses'),
        onTap: () {
          Get.to(() => AddressScreen());
        },
      ),
      ListTile(
        leading: Icon(Icons.help),
        title: Text('Contact Us'),
        onTap: () {
          Get.to(() => Contact());
        },
      ),
      ListTile(
        leading: Icon(Icons.group),
        title: Text('Developer Info'),
        onTap: () {
          Get.to(() => DeveloperInfo());
        },
      ),
      ListTile(
        leading: Icon(Icons.update),
        title: Text('Update App'),
        onTap: () {
          launchUrl(
              "https://play.google.com/store/apps/details?id=com.gepton.shreesurbhia2");
        },
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text('Log Out'),
        onTap: _authController.signOut,
      )
    ],
  ),
);
