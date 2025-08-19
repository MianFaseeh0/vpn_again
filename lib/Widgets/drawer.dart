import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpnapp/login-pages/welcome_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({required this.gotosetting, super.key});

  final void Function() gotosetting;

  Future<void> logOut(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => WelcomeScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 52),
      child: Column(
        children: [
          Container(
            height: 68,
            width: 224,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFF185BFF),
            ),
            child: Row(
              children: [
                Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 118, 157, 255),
                  ),
                  child: SvgPicture.asset(
                    'assets/drawer/Group.svg',
                    height: 5,
                    width: 5,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Name',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Disconnected',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const SizedBox(width: 16),
              const Text(
                'Main Menu',
                style: TextStyle(
                  fontFamily: 'gilroy',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          ListTile(
            onTap: gotosetting,
            leading: SvgPicture.asset('assets/drawer/setting.svg'),
            title: const Text(
              'Settings',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'gilroy',
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset('assets/drawer/user-octagon.svg'),
            title: Text(
              'Account',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'gilroy',
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset('assets/drawer/eye.svg'),
            title: const Text(
              'Show Log',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'gilroy',
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset('assets/drawer/note.svg'),
            title: const Text(
              'Report',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'gilroy',
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset('assets/drawer/emoji-happy.svg'),
            title: const Text(
              'Help',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'gilroy',
              ),
            ),
          ),
          ListTile(
            onTap: () async {
              await logOut(context);
            },
            leading: SvgPicture.asset('assets/drawer/logout.svg'),
            title: const Text(
              'Log Out',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'gilroy',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
