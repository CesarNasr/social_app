import '../entities/posts_entity.dart';

abstract interface class PostsRepository {
  Future<List<PostEntity>> getPosts();
}