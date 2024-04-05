import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insta/CommentSheet.dart';

class Post {
  final String username;
  final String avatar;
  final String image;
  final String caption;

  Post({
    required this.username,
    required this.avatar,
    required this.image,
    required this.caption,
  });
}

//Post Widget

class PostWidget extends StatefulWidget {
  final Post post;
  

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool _isLiked = false;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {

    List<Comment> comments = [
      Comment(username: 'supri_23', avatar: "user2.jpg", CommentText: "Comment Test")
    ];
    
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 0, 2.0, 0),
                child: CircleAvatar(
                  radius: 15.0,
                  backgroundImage: AssetImage(widget.post.avatar),
                ),
              ),
              SizedBox(width: 8.0),
              Text(
                widget.post.username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          // Image
          Image.asset(
            widget.post.image,
            height: 350,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(height: 8.0),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0),
              child: Row(
                children: [
                  IconButton(
                    icon:
                        Icon(_isLiked ? Icons.favorite : Icons.favorite_border),
                    color: _isLiked ? Colors.red : null,
                    onPressed: () {
                      setState(() {
                        _isLiked = !_isLiked;
                      });
                    },
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.messenger_outline)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.send_outlined))
                ],
              )),
          // Like Button

          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 8, 0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${widget.post.username} ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: _isExpanded
                        ? widget.post.caption
                        : (widget.post.caption.length > 40
                            ? widget.post.caption.substring(0, 50)
                            : widget.post.caption),
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextSpan(
                    text: _isExpanded
                        ? " read less"
                        : (widget.post.caption.length > 40
                            ? " ... read more"
                            : ""),
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return CommentsWidget(comments: comments);
                },
              );
            },
            child: Text(
              "Lihat semua komentar ...",
              style: TextStyle(
                  color: Colors.grey[400], fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}

class PostFeed extends StatefulWidget {
  final List<Post> posts;

  const PostFeed({Key? key, required this.posts}) : super(key: key);

  @override
  _PostFeedState createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.posts.length,
      itemBuilder: (BuildContext context, int index) {
        return PostWidget(post: widget.posts[index]);
      },
    );
  }
}
