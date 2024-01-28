import 'package:flutter/material.dart';
import 'package:profile/screens/edit_profile.dart';
import 'package:profile/screens/log_in.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: const Icon(
          Icons.notes,
          color: Colors.black,
          size: 35,
        ),
        title: const Align(
          alignment: AlignmentDirectional(-1.00, 0.00),
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.00, 0.00),
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://th.bing.com/th/id/OIP.audMX4ZGbvT2_GJTx2c4GgHaHw?rs=1&pid=ImgDetMain',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text(
                'User Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(right: 18, left: 18),
                child: Divider(
                  thickness: 1,
                  color: Color(0xFFB2B2B2),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()));
                      },
                      child: const ListTile(
                        leading: Icon(
                          Icons.person_outline_rounded,
                          color: Colors.black,
                        ),
                        title: Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                        dense: false,
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Favourites',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                      dense: false,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      },
                      child: const ListTile(
                        leading: Icon(
                          Icons.logout_rounded,
                          color: Color(0xFFFF0000),
                        ),
                        title: Text(
                          'Log Out',
                          style: TextStyle(
                            color: Color(0xFFFF0000),
                            fontSize: 20,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFFFF0000),
                          size: 20,
                        ),
                        dense: false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
