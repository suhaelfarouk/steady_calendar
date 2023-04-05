import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../config/constants.dart';

class Background extends StatelessWidget {
  final String? backgroundSlug;

  const Background({super.key, this.backgroundSlug});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl:
          "${baseBackgroundImageURL(dotenv.env['SUPABASE_PROJECT_ID']!)}/$backgroundSlug",
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    ));
  }
}
