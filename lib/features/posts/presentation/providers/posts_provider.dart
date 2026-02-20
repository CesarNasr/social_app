import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_client.dart';
import '../../data/datasources/posts_remote_datasource.dart';
import '../../data/repositories/posts_repository_impl.dart';
import '../../domain/entities/posts_entity.dart';
import '../../domain/repositories/posts_repository.dart';

final dioProvider = Provider((ref) => DioClient.instance);

final postsRemoteDatasourceProvider = Provider<PostsRemoteDatasource>((ref) {
  return PostsRemoteDatasourceImpl(ref.watch(dioProvider));
});

final postsRepositoryProvider = Provider<PostsRepository>((ref) {
  return PostsRepositoryImpl(ref.watch(postsRemoteDatasourceProvider));
});

class PostsNotifier extends AsyncNotifier<List<PostEntity>> {
  @override
  Future<List<PostEntity>> build() async {
    return _fetchPosts();
  }

  Future<List<PostEntity>> _fetchPosts() async {
    final repository = ref.read(postsRepositoryProvider);
    return repository.getPosts();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchPosts());
  }
}

final postsProvider = AsyncNotifierProvider<PostsNotifier, List<PostEntity>>(
  PostsNotifier.new,
);
