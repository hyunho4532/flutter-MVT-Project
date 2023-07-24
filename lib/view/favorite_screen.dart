
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  Query dbRef = FirebaseDatabase.instance.ref().child('favorite/actors');

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      body: Column (
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Padding (
            padding: EdgeInsets.only(left: 12.0, top: 24.0),
            child: Text (
              '안녕하세요, User 님',
              style: TextStyle (
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          const Padding (
            padding: EdgeInsets.only(left: 12.0, top: 180.0),
            child: Text (
              'User 님의 좋아하는 배우',
              style: TextStyle (
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          Expanded (
            flex: 1,
            child: SizedBox (
                child: FirebaseAnimatedList (
                  scrollDirection: Axis.horizontal,
                  query: dbRef,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                    String actors = snapshot.value.toString();

                    return Column (
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Container (
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(250),
                              image: DecorationImage (
                                image: NetworkImage (
                                    'https://image.tmdb.org/t/p/w500$actors',
                                ),
                              )
                          ),
                        )
                      ],
                    );
                  },
                )
            ),
          ),
        ],
      ),
    );
  }
}
