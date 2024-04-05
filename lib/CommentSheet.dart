import 'package:flutter/material.dart';

class Comment {
  final String username;
  final String avatar;
  final String CommentText;

  Comment({
    required this.username,
    required this.avatar,
    required this.CommentText,
  });
}

class CommentsWidget extends StatefulWidget {
  final List<Comment> comments;

  const CommentsWidget({Key? key, required this.comments}) : super(key: key);

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.comments.length,
      itemBuilder: (BuildContext context, int index) {
        final comment = widget.comments[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage(comment.avatar),
          ),
          title: Text(comment.username),
          subtitle: Text(
              comment.CommentText), 
          trailing: IconButton(
            icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border),
            color: _isLiked ? Colors.red : null,
            onPressed: () {
              setState(() {
                _isLiked = !_isLiked;
              });
            },
          ),
        );
      },
    );
  }
}
