import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imgUrl =
        'https://scontent.fdac135-1.fna.fbcdn.net/v/t39.30808-6/363789631_2458612804316589_6995321894466664993_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeGhtVyd9Tu2SRv4A1zwHu_wMe3x55381hEx7fHnnfzWEZLy7pPhQ793NPbzgykmvnnbe9RG7fkq5l_327_-toHX&_nc_ohc=IwgiL6wrh1QAX8wzE4q&_nc_ht=scontent.fdac135-1.fna&oh=00_AfCEdQ91fY-YedGtgQjFlnzhE9-mIyQBU29GoXSDNIW_sA&oe=658DC965';
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imgUrl),
                ),
                margin: EdgeInsets.zero,
                accountName:
                    Text('Ferdoush', style: TextStyle(color: Colors.white)),
                accountEmail: Text('ferdoush@gmail.com',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                'Email me',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
