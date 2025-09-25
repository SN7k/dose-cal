import 'package:flutter/material.dart';

class CustomAnimatedBottomNav extends StatefulWidget {
  final List<BottomNavItem> items;
  final Function(int) onTap;
  final int currentIndex;
  final Color backgroundColor;
  final Color selectedColor;
  final Color unselectedColor;
  final double height;
  final Widget? floatingActionButton;
  final VoidCallback? onFloatingActionButtonPressed;
  final bool centerFAB;

  const CustomAnimatedBottomNav({
    super.key,
    required this.items,
    required this.onTap,
    this.currentIndex = 0,
    this.backgroundColor = const Color(0xFF0B1220),
    this.selectedColor = const Color(0xFF5B6BE1),
    this.unselectedColor = Colors.white54,
    this.height = 80.0,
    this.floatingActionButton,
    this.onFloatingActionButtonPressed,
    this.centerFAB = false,
  });

  @override
  State<CustomAnimatedBottomNav> createState() => _CustomAnimatedBottomNavState();
}

class _CustomAnimatedBottomNavState extends State<CustomAnimatedBottomNav>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _bubblePosition;
  int _selectedIndex = 0;
  int _previousIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
    _previousIndex = widget.currentIndex;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500), // Slightly faster like in the UI
      vsync: this,
    );
    _bubblePosition = Tween<double>(
      begin: _mapIndexToPosition(_selectedIndex),
      end: _mapIndexToPosition(_selectedIndex),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack, // Bouncy curve like in the UI
    ));
  }

  @override
  void didUpdateWidget(CustomAnimatedBottomNav oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _updateSelectedIndex(widget.currentIndex);
    }
  }

  void _updateSelectedIndex(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _previousIndex = _selectedIndex;
        _selectedIndex = index;
      });
      
      // Update the bubble position animation
      // Map the actual positions considering the center FAB space
      double previousPos = _mapIndexToPosition(_previousIndex);
      double currentPos = _mapIndexToPosition(_selectedIndex);
      
      _bubblePosition = Tween<double>(
        begin: previousPos,
        end: currentPos,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack, // Consistent bouncy curve like in the UI
      ));
      
      _animationController.forward(from: 0.0);
    }
  }

  // Map navigation index to bubble position (considering center FAB)
  double _mapIndexToPosition(int index) {
    if (widget.centerFAB && widget.items.length == 4) {
      if (index == 0) return 0.0;
      if (index == 1) return 1.0;
      if (index == 2) return 3.0;
      if (index == 3) return 4.0;
    }
    return index.toDouble();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: CustomPaint(
            painter: _BottomNavPainter(
              selectedIndex: _selectedIndex,
              itemCount: widget.items.length,
              bubblePosition: _bubblePosition,
              backgroundColor: widget.backgroundColor,
              selectedColor: widget.selectedColor,
              centerFAB: widget.centerFAB,
            ),
            child: Row(
              mainAxisAlignment: widget.centerFAB 
                ? MainAxisAlignment.center 
                : MainAxisAlignment.spaceEvenly,
              children: _buildNavItems(),
            ),
          ),
        ),
        // Floating Action Button
        if (widget.floatingActionButton != null)
          _buildFloatingActionButton(),
      ],
    );
  }

  List<Widget> _buildNavItems() {
    if (widget.centerFAB && widget.items.length % 2 == 0) {
      // Even number of items with center FAB - split items around center
      final leftItems = widget.items.take(widget.items.length ~/ 2).toList();
      final rightItems = widget.items.skip(widget.items.length ~/ 2).toList();
      
      return [
        ...leftItems.asMap().entries.map((entry) => 
          Expanded(child: _buildNavItem(entry.key))),
        const SizedBox(width: 72), // Space for center FAB (slightly larger)
        ...rightItems.asMap().entries.map((entry) => 
          Expanded(child: _buildNavItem(entry.key + leftItems.length))),
      ];
    } else {
      // Regular layout - all items evenly spaced
      return List.generate(
        widget.items.length, 
        (index) => Expanded(child: _buildNavItem(index))
      );
    }
  }

  Widget _buildFloatingActionButton() {
    if (widget.centerFAB) {
      // Center positioned FAB at same level as nav items
      return Positioned(
        left: MediaQuery.of(context).size.width / 2 - 28, // Center of screen
        top: widget.height / 2 - 28, // Same level as nav items
        child: GestureDetector(
          onTap: widget.onFloatingActionButtonPressed,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.selectedColor,
              boxShadow: [
                BoxShadow(
                  color: widget.selectedColor.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: widget.floatingActionButton,
          ),
        ),
      );
    } else {
      // Moving FAB that follows the animated bubble
      return AnimatedBuilder(
        animation: _bubblePosition,
        builder: (context, child) {
          final itemWidth = MediaQuery.of(context).size.width / widget.items.length;
          final animatedBubblePos = _bubblePosition.value;
          final notchCenter = (animatedBubblePos + 0.5) * itemWidth;
          
          return Positioned(
            left: notchCenter - 28, // Half of FAB width (56/2)
            top: -28, // Position above the nav bar
            child: GestureDetector(
              onTap: widget.onFloatingActionButtonPressed,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.selectedColor,
                  boxShadow: [
                    BoxShadow(
                      color: widget.selectedColor.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: widget.floatingActionButton,
              ),
            ),
          );
        },
      );
    }
  }

  Widget _buildNavItem(int index) {
    final isSelected = _selectedIndex == index;
    final item = widget.items[index];

    return GestureDetector(
      onTap: () {
        _updateSelectedIndex(index);
        widget.onTap(index);
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // Only show background circle if not in center FAB mode or not selected
          color: (isSelected && !widget.centerFAB) ? widget.selectedColor : Colors.transparent,
        ),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: isSelected ? 1.0 + (_animationController.value * 0.1) : 1.0,
              child: Icon(
                item.icon,
                color: isSelected ? 
                  (widget.centerFAB ? widget.selectedColor : Colors.white) : 
                  widget.unselectedColor,
                size: isSelected ? 28 : 24,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _BottomNavPainter extends CustomPainter {
  final int selectedIndex;
  final int itemCount;
  final Animation<double> bubblePosition;
  final Color backgroundColor;
  final Color selectedColor;
  final bool centerFAB;

  _BottomNavPainter({
    required this.selectedIndex,
    required this.itemCount,
    required this.bubblePosition,
    required this.backgroundColor,
    required this.selectedColor,
    this.centerFAB = false,
  }) : super(repaint: bubblePosition);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    if (centerFAB) {
      // Draw background with center notch
      _drawCenterNotch(canvas, size, paint);
    } else {
      // Draw background with animated moving bubble
      _drawAnimatedBubble(canvas, size, paint);
    }
  }

  void _drawAnimatedBubble(Canvas canvas, Size size, Paint paint) {
    // Draw the main background
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Calculate the animated position for the bubble
    // For center FAB layout, we have 5 positions (4 nav + 1 center)
    final totalPositions = centerFAB ? 5 : itemCount;
    final itemWidth = size.width / totalPositions;
    final currentBubblePos = bubblePosition.value;
    final bubbleCenter = (currentBubblePos + 0.5) * itemWidth;
    
    // Draw a circular bubble like in the UI
    final bubbleRadius = 25.0; // Slightly smaller but more prominent
    final bubbleY = size.height * 0.35; // Position bubble in upper-middle part of nav
    
    // Draw the circular bubble
    final bubblePaint = Paint()
      ..color = selectedColor
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(
      Offset(bubbleCenter, bubbleY),
      bubbleRadius,
      bubblePaint,
    );
    
    // Add a subtle shadow/glow effect
    final shadowPaint = Paint()
      ..color = selectedColor.withOpacity(0.4) // More visible shadow
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    
    canvas.drawCircle(
      Offset(bubbleCenter, bubbleY),
      bubbleRadius + 4,
      shadowPaint,
    );
  }

  void _drawCenterNotch(Canvas canvas, Size size, Paint paint) {
    // For center FAB at same level, just draw a flat background
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class BottomNavItem {
  final IconData icon;
  final String label;

  const BottomNavItem({
    required this.icon,
    required this.label,
  });
}
