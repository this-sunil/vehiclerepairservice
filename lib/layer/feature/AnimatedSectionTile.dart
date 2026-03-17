import 'package:flutter/material.dart';
class AnimatedSectionTile extends StatefulWidget {
  final int index;
  final IconData icon;
  final String title;
  final String content;

  const AnimatedSectionTile({
    super.key,
    required this.index,
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  State<AnimatedSectionTile> createState() => _AnimatedSectionTileState();
}

class _AnimatedSectionTileState extends State<AnimatedSectionTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    Future.delayed(
      Duration(milliseconds: 120 * widget.index),
          () => _controller.forward(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    const brandColor = Color(0xFFFF6F00); // Vehicle / Repair Brand

    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Container(
          margin: const EdgeInsets.only(bottom: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black54
                    : Colors.black.withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Theme(
            data: theme.copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),
              childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              backgroundColor:
              isDark ? const Color(0xFF1E1E1E) : Colors.white,
              collapsedBackgroundColor:
              isDark ? const Color(0xFF1E1E1E) : Colors.white,
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: brandColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.icon,
                  color: brandColor,
                ),
              ),
              title: Text(
                widget.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              children: [
                Text(
                  widget.content,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    height: 1.7,
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
