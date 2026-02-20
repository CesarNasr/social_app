import '../../../../core/errors/failures.dart';
import '../../domain/entities/posts_entity.dart';
import '../../domain/repositories/posts_repository.dart';
import '../datasources/posts_remote_datasource.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsRemoteDatasource _remoteDatasource;

  PostsRepositoryImpl(this._remoteDatasource);

  @override
  Future<List<PostEntity>> getPosts() async {
    try {
      final posts = await _remoteDatasource.getPosts();
      return posts;
    } on Failure {
      rethrow;
    } catch (e) {
      throw const UnknownFailure('An unexpected error occurred.');
    }
  }
}