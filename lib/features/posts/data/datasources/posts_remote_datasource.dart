import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/failures.dart';
import '../models/post_model.dart';

abstract interface class PostsRemoteDatasource {
  Future<List<PostModel>> getPosts();
}

class PostsRemoteDatasourceImpl implements PostsRemoteDatasource {
  final Dio _dio;

  PostsRemoteDatasourceImpl(this._dio);

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await _dio.get(ApiConstants.postsEndpoint);

      final List<dynamic> data = response.data as List<dynamic>;

      return data
          .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          throw const NetworkFailure('Connection timed out. Check your internet.');
        case DioExceptionType.connectionError:
          throw const NetworkFailure('No internet connection.');
        default:
          throw ServerFailure(
            e.response?.statusMessage ?? 'Something went wrong.',
          );
      }
    } catch (e) {
      throw const UnknownFailure('An unexpected error occurred.');
    }
  }
}