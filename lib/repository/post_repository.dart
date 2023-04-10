import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/post.dart';

class PostRepository {
  static Future<void> updatePost(Post postData) async {
    await FirebaseFirestore.instance.collection('posts').add(postData.toMap());
  }
}
