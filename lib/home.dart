import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginassign/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List Name = [
    'Arun',
    'Amal',
    'Jithin',
    'Akesh',
    'Ajmal',
    'Atheesh',
    'Rahul',
    'Abhijith',
    'Bilal',
    'Boney',
    'Stephen',
    'Manikyam',
    'Sagar Alias Jacky',
    'Maathan',
    'thomaachan',
    'Neelakandan',
    'Arakkal Abu'
  ];

  List Imagess = [
    'assets/images/user1.png',
    'assets/images/user2.jpg',
    'assets/images/user3.jpg',
    'assets/images/user4.png',
    'assets/images/user5.jpg',
    'assets/images/user6.jpg',
    'assets/images/user7..png',
    'assets/images/user8.webp',
    'assets/images/bilal.webp',
    'assets/images/user9.png',
    'assets/images/stephen.jpg',
    'assets/images/manikyam.jpg',
    'assets/images/sagar alias jacky.jpg',
    'assets/images/maathan.jpg',
    'assets/images/thoma.jpg',
    'assets/images/neelakan.jpg',
    'assets/images/abu.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 76, 99, 1),
      appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 150,
          backgroundColor: Color.fromARGB(255, 95, 157, 174),
          title: Text(
            'Home',
            style: GoogleFonts.imFellDwPica(fontSize: 60, color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  signout(context);
                },
                icon: Icon(Icons.exit_to_app)),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(100),
            ),
          )),
      body: SafeArea(
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('${Imagess[index]}'),
              ),
              title: Text(
                Name[index],
                style: GoogleFonts.actor(fontSize: 18, color: Colors.white),
              ),
              subtitle: Text('New Message',
                  style:
                      GoogleFonts.poppins(fontSize: 15, color: Colors.white)),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: Name.length,
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginHome()), (route) => false);
  }
}
