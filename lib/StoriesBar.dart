import 'package:flutter/material.dart';

class User {
  final String username;
  final String avatar;

  User({required this.username, required this.avatar});
}

class StoriesBar extends StatefulWidget {
  final List<User> users;

  const StoriesBar({Key? key, required this.users}) : super(key: key);

  @override
  _StoriesBarState createState() => _StoriesBarState();
}

class _StoriesBarState extends State<StoriesBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300
      ))),
      height: 120.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.users.length,
        itemBuilder: (BuildContext context, int index) {
          final user = widget.users[index];
          return Padding(
            
            padding: EdgeInsets.fromLTRB(15.0, 8, 15, 8),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: SweepGradient(colors: [Colors.purple,Colors.orange,Colors.pink,Colors.purple,]),
                    
                    shape: BoxShape.circle
                  ),
                  child: Padding(padding: EdgeInsets.all(3),
                  
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 4
                      ),
                      shape: BoxShape.circle
                    ),
                  child: CircleAvatar(
                  
                  radius: 33.0,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage(user.avatar),
                ),
                  ))
                ),
                
                SizedBox(height: 4.0),
                Text(
                  user.username,
                  style: TextStyle(fontSize: 13.0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
