import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/core/router/route_constants.dart';
import '../../domain/entities/posts_entity.dart';

class DetailScreen extends StatelessWidget {
  final PostEntity post;

  const DetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E2E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF89B4FA),
          ),
            onPressed: () => context.go(RouteConstants.home)
        ),
        title: const Text(
          'Post Detail',
          style: TextStyle(
            color: Color(0xFFCDD6F4),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMetaRow(post),
            const SizedBox(height: 20),
            _buildTitleCard(post.title),
            const SizedBox(height: 16),
            _buildBodyCard(post.body),
          ],
        ),
      ),
    );
  }

  Widget _buildMetaRow(PostEntity post) {
    return Row(
      children: [
        _buildBadge(label: 'Post #${post.id}', color: const Color(0xFF89B4FA)),
        const SizedBox(width: 8),
        _buildBadge(
          label: 'User #${post.userId}',
          color: const Color(0xFFA6E3A1),
        ),
      ],
    );
  }

  Widget _buildBadge({required String label, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withAlpha(38),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withAlpha(76)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTitleCard(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF313244),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF45475A),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.title_rounded,
                color: Color(0xFF89B4FA),
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                'Title',
                style: TextStyle(
                  color: Color(0xFF89B4FA),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFCDD6F4),
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyCard(String body) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF313244),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF45475A),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.article_rounded,
                color: Color(0xFFA6E3A1),
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                'Body',
                style: TextStyle(
                  color: Color(0xFFA6E3A1),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            body,
            style: const TextStyle(
              color: Color(0xFFCDD6F4),
              fontSize: 15,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}