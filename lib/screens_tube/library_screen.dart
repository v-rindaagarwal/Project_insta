import 'package:flutter/material.dart';

import 'package:start_up/data/colors.dart';

import 'package:start_up/widgets/app_bar.dart';

class LibraryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.history, color: suvaGrey),
                  title: Text(
                    'History',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.file_download, color: suvaGrey),
                  title:
                      Text('Downloads', style: TextStyle(color: Colors.white)),
                  subtitle: Text('2 recommendations',
                      style: TextStyle(color: suvaGrey, fontSize: 12.0)),
                ),
                ListTile(
                  leading: Icon(Icons.video_library, color: suvaGrey),
                  title: Text('Your videos',
                      style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  leading: Icon(Icons.attach_money, color: suvaGrey),
                  title:
                      Text('Purchases', style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  leading: Icon(Icons.watch_later, color: suvaGrey),
                  title: Text('Watch later',
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text('Videos you save for later',
                      style: TextStyle(color: suvaGrey, fontSize: 12.0)),
                ),
                Divider(color: Colors.white),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Playlists',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0)),
                      Row(
                        children: <Widget>[
                          Text('Recently added',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0)),
                          Icon(Icons.arrow_drop_down, color: Colors.white)
                        ],
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.add, color: linkBlue),
                  title:
                      Text('New Playlist', style: TextStyle(color: linkBlue)),
                ),
                ListTile(
                  leading: Icon(Icons.thumb_up, color: suvaGrey),
                  title: Text('Liked videos',
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text('4 Videos',
                      style: TextStyle(color: suvaGrey, fontSize: 12.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
