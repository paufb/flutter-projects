import 'package:flutter/material.dart';

class PagePreviewCard extends StatelessWidget {
  const PagePreviewCard({
    super.key,
    required this.title,
    required this.description,
    required this.thumbnailSource,
  });

  final String title;
  final String description;
  final String thumbnailSource;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        height: 100,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Title(
                      title: title,
                      color: Theme.of(context).colorScheme.onPrimary,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.white,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.5, 1.0],
                        ).createShader(bounds),
                        blendMode: BlendMode.dstIn,
                        child: Text(description, overflow: TextOverflow.clip),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                thumbnailSource,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
