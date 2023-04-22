import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatefulWidget {
   const SettingsScreen({Key? key}) : super(key: key);


  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
Widget userTile(){
  final user = FirebaseAuth.instance.currentUser!;
  return ListTile(
    leading: CircleAvatar(
      radius: 38,
      backgroundImage: NetworkImage(user.photoURL!),

    ),
    title: Text (" ${user.displayName}"),
  );
}
Widget divider()
{
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Divider(
      thickness: 1.5,

    ),
  );
}
Widget colorTiles(){
  return Column(
    children: [
      ( colorTile(Icons.sunny,Colors.white," Change Theme")),
      colorTile(Icons.support_agent_outlined,Colors.white,"Support"),
      colorTile(Icons.featured_play_list,Colors.white,"Features Overview"),
      colorTile(Icons.logout_rounded,Colors.white,"Logout"),
    ],
  );
}
Widget bwTiles(){
  return Column(
    children: [
      bwTile(Icons.info_outline,"Faqs"),
      bwTile(Icons.people,"Dvelopers"),
      bwTile(Icons.calculate,"Version"),
    ],
  );
}
Widget bwTile(IconData icon, String text){
  return colorTile(icon, Colors.black,text,blackandWhite: true);
}

Widget colorTile(IconData icon , Color color , String txt,{bool blackandWhite=false
})
{
  return ListTile(
    leading: Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Icon(icon,color: color),
    ),
    title: Text(
      txt
    ),
    trailing: Icon(
      Icons.arrow_forward_ios,color:Colors.black,size: 20,
    ),
  );
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: ListView
        (
        padding: EdgeInsets.all(12),
        physics: BouncingScrollPhysics(),
        children: [
          Container(height: 35),
          userTile(),
          divider(),
          colorTiles(),
          divider(),
          bwTiles(),
        ],
      ),
    );
  }
}
