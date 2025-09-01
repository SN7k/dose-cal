import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'auth/data/auth_service.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;
final _pages = [
    const _OnbPage(
      title: 'Welcome to\nDose-Cal 👋',
      subtitle:
          'Your trusted companion for safe\nand accurate pediatric dosing.',
      pageIndex: 1,
    ),
    const _OnbPage(
      title: 'Fast, Reliable & Offline\nCalculations for Every Case',
      pageIndex: 2,
    ),
    const _OnbPage(
      title: 'Clinical Safety with\nBuilt-in Guardrails to Reduce Errors',
      pageIndex: 3,
    ),
    const _OnbPage(
      title: 'Secure Medical Access\nTailored for Professionals',
      pageIndex: 4,
    ),
  ];
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next() async {
    if (_index < _pages.length - 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {

      await AuthService.completeOnboarding();
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  void _skip() async {
    await AuthService.completeOnboarding();
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    
    final buttonPadding = screenWidth < 400 ? 12.0 : 20.0;
    final buttonHeight = screenWidth < 400 ? 50.0 : 56.0;
    
    final dots = List.generate(_pages.length, (i) {
      final active = i == _index;
      final activeDotSize = screenWidth < 400 ? 8.0 : 10.0;
      final inactiveDotSize = screenWidth < 400 ? 6.0 : 7.0;
      final dotSpacing = screenWidth < 400 ? 4.0 : 5.0;
      
      return AnimatedContainer(
        duration: const Duration(milliseconds: 500),  
        curve: Curves.easeInOutCubic, 
        margin: EdgeInsets.symmetric(horizontal: dotSpacing),
        height: active ? activeDotSize : inactiveDotSize,
        width: active ? activeDotSize : inactiveDotSize,
        decoration: BoxDecoration(
          color: active ? const Color(0xFF3B82F6) : const Color(0xFF3B82F6).withOpacity(0.3),
          shape: BoxShape.circle,
          boxShadow: active ? [
            BoxShadow(
              color: const Color(0xFF3B82F6).withOpacity(0.6),
              blurRadius: 12,
              spreadRadius: 3,
              offset: const Offset(0, 2),
            )
          ] : [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 1,
              offset: const Offset(0, 1),
            )
          ],
        ),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 16, 
                  top: screenSize.height < 700 ? 4 : 8, 
                ),
                child: TextButton(
                  onPressed: _skip,
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) => _pages[i],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenSize.height < 700 ? 8 : 20, 
                bottom: screenSize.height < 700 ? 16 : 36, 
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: dots,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                buttonPadding, 
                0, 
                buttonPadding, 
                screenSize.height < 700 ? 16 : 32, 
              ),
              child: SizedBox(
                width: double.infinity,
                height: buttonHeight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    foregroundColor: Colors.white,
                    elevation: 8,
                    shadowColor: const Color(0xFF3B82F6).withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: _next,
                  child: Text(
                    _index == _pages.length - 1 ? 'Get Started' : 'Next',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnbPage extends StatelessWidget {
  final String title;
  final String? subtitle;
  final int? pageIndex;

  const _OnbPage({
    required this.title,
    this.subtitle,
    this.pageIndex,
  });

  Widget _buildIllustration(int index) {
    return switch (index) {
      1 => _buildWelcomeScreen(),
      2 => _buildDoctorsScreen(),
      3 => _buildHealthCheckScreen(),
      4 => _buildGetStartedScreen(),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _buildWelcomeScreen() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = MediaQuery.of(context).size;
        final screenWidth = screenSize.width;
        final screenHeight = screenSize.height;
        
        final containerHeight = math.min(screenHeight * 0.45, 380.0); 
        final containerWidth = math.min(screenWidth * 0.9, 380.0);
        final avatarSize = screenWidth < 400 ? 60.0 : 80.0;
        final radius = screenWidth < 400 ? 100.0 : 140.0; 
        final particleCount = screenWidth < 400 ? 8 : 15; 
        
        final dotPositions = List.generate(particleCount, (index) {
          final seed = index * 123 + 456; 
          final random = math.Random(seed);
          
          final centerX = screenWidth * 0.5;
          final centerY = containerHeight * 0.5;
          final exclusionRadius = math.min(screenWidth * 0.35, containerHeight * 0.35);
          
          double x = random.nextDouble() * (screenWidth * 0.85);
          double y = random.nextDouble() * containerHeight;
          
          final distanceFromCenter = math.sqrt(
            math.pow(x - centerX, 2) + math.pow(y - centerY, 2)
          );
          
          if (distanceFromCenter <= exclusionRadius) {
            if (x < centerX) {
              x = random.nextDouble() * (screenWidth * 0.2); 
            } else {
              x = screenWidth * 0.65 + random.nextDouble() * (screenWidth * 0.2); 
            }
            
            if (y < centerY) {
              y = random.nextDouble() * (containerHeight * 0.25); 
            } else {
              y = containerHeight * 0.75 + random.nextDouble() * (containerHeight * 0.25); 
            }
          }
          
          return {
            'x': x,
            'y': y,
            'size': random.nextDouble() * 20 + 15, 
          };
        });
        
        final doctorImages = [
          'assets/images/doctor1.jpg', 
          'assets/images/doctor2.jpg',
          'assets/images/doctor3.jpg',
          'assets/images/doctor4.jpg',
          'assets/images/doctor5.jpg',
          'assets/images/doctor6.jpg',
          'assets/images/doctor7.jpg',
          'assets/images/doctor8.jpg',
        ];

        return SizedBox(
          height: containerHeight,
          child: Stack(
            children: [
              ...dotPositions.map((dot) {
                return Positioned(
                  left: dot['x']!,
                  top: dot['y']!,
                  child: Container(
                    width: dot['size']!,
                    height: dot['size']!,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6).withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }),
              Center(
                child: SizedBox(
                  width: containerWidth,
                  height: containerWidth,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ...List.generate(8, (index) {
                        final double angle = (index / 8) * 2 * math.pi;
                        final double x = (containerWidth / 2) + radius * math.cos(angle) - (avatarSize / 2);
                        final double y = (containerWidth / 2) + radius * math.sin(angle) - (avatarSize / 2);

                        return Positioned(
                          left: x,
                          top: y,
                          child: Container(
                            width: avatarSize,
                            height: avatarSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF3B82F6),
                                width: screenWidth < 400 ? 2 : 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                doctorImages[index % doctorImages.length],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.white,
                                    child: Icon(
                                      Icons.person,
                                      size: avatarSize * 0.5,
                                      color: const Color(0xFF3B82F6),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDoctorsScreen() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = MediaQuery.of(context).size;
        final screenWidth = screenSize.width;
        final screenHeight = screenSize.height;
        
        final containerHeight = math.min(screenHeight * 0.45, 380.0); 
        final imageSize = screenWidth < 400 ? 240.0 : 320.0; 
        final particleCount = screenWidth < 400 ? 8 : 12;
        
        final dotPositions = List.generate(particleCount, (index) {
          final seed = index * 234 + 567; 
          final random = math.Random(seed);
          
          final centerX = screenWidth * 0.5;
          final centerY = containerHeight * 0.5;
          final exclusionRadius = math.min(screenWidth * 0.3, containerHeight * 0.3);
          
          double x = random.nextDouble() * (screenWidth * 0.85);
          double y = random.nextDouble() * containerHeight;
          
          final distanceFromCenter = math.sqrt(
            math.pow(x - centerX, 2) + math.pow(y - centerY, 2)
          );
          
          if (distanceFromCenter <= exclusionRadius) {
            if (x < centerX) {
              x = random.nextDouble() * (screenWidth * 0.25); 
            } else {
              x = screenWidth * 0.6 + random.nextDouble() * (screenWidth * 0.25);
            }
            
            if (y < centerY) {
              y = random.nextDouble() * (containerHeight * 0.25); 
            } else {
              y = containerHeight * 0.75 + random.nextDouble() * (containerHeight * 0.25); 
            }
          }
          
          return {
            'x': x,
            'y': y,
            'size': random.nextDouble() * 25 + 18, 
          };
        });
        
        return SizedBox(
          height: containerHeight,
          child: Stack(
            children: [
              ...dotPositions.map((dot) {
                return Positioned(
                  left: dot['x']!,
                  top: dot['y']!,
                  child: Container(
                    width: dot['size']!,
                    height: dot['size']!,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6).withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }),
              Center(
                child: Image.asset(
                  'assets/images/onb1.png',
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: imageSize,
                      height: imageSize,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.group,
                        color: const Color(0xFF3B82F6),
                        size: imageSize * 0.4,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHealthCheckScreen() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = MediaQuery.of(context).size;
        final screenWidth = screenSize.width;
        final screenHeight = screenSize.height;
        
        final containerHeight = math.min(screenHeight * 0.45, 380.0);
        final imageSize = screenWidth < 400 ? 240.0 : 320.0; 
        final particleCount = screenWidth < 400 ? 6 : 10;
        
        final dotPositions = List.generate(particleCount, (index) {
          final seed = index * 345 + 678; 
          final random = math.Random(seed);
          
          final centerX = screenWidth * 0.5;
          final centerY = containerHeight * 0.5;
          final exclusionRadius = math.min(screenWidth * 0.3, containerHeight * 0.3);
          
          double x = random.nextDouble() * (screenWidth * 0.85);
          double y = random.nextDouble() * containerHeight;
          
          final distanceFromCenter = math.sqrt(
            math.pow(x - centerX, 2) + math.pow(y - centerY, 2)
          );
          
          if (distanceFromCenter <= exclusionRadius) {
            if (x < centerX) {
              x = random.nextDouble() * (screenWidth * 0.25);
            } else {
              x = screenWidth * 0.6 + random.nextDouble() * (screenWidth * 0.25); 
            }
            
            if (y < centerY) {
              y = random.nextDouble() * (containerHeight * 0.25); 
            } else {
              y = containerHeight * 0.75 + random.nextDouble() * (containerHeight * 0.25); 
            }
          }
          
          return {
            'x': x,
            'y': y,
            'size': random.nextDouble() * 22 + 16, 
          };
        });
        
        return SizedBox(
          height: containerHeight,
          child: Stack(
            children: [
              ...dotPositions.map((dot) {
                return Positioned(
                  left: dot['x']!,
                  top: dot['y']!,
                  child: Container(
                    width: dot['size']!,
                    height: dot['size']!,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6).withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }),
              Center(
                child: Image.asset(
                  'assets/images/onb2.png',
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: imageSize,
                      height: imageSize,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.medical_services_outlined,
                        color: const Color(0xFF3B82F6),
                        size: imageSize * 0.4,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGetStartedScreen() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = MediaQuery.of(context).size;
        final screenWidth = screenSize.width;
        final screenHeight = screenSize.height;
        
        final containerHeight = math.min(screenHeight * 0.45, 380.0); 
        final imageSize = screenWidth < 400 ? 240.0 : 320.0; 
        final particleCount = screenWidth < 400 ? 5 : 8;
        
        final dotPositions = List.generate(particleCount, (index) {
          final seed = index * 456 + 789; 
          final random = math.Random(seed);
          
          final centerX = screenWidth * 0.5;
          final centerY = containerHeight * 0.5;
          final exclusionRadius = math.min(screenWidth * 0.3, containerHeight * 0.3);
          
          double x = random.nextDouble() * (screenWidth * 0.85);
          double y = random.nextDouble() * containerHeight;
          
          final distanceFromCenter = math.sqrt(
            math.pow(x - centerX, 2) + math.pow(y - centerY, 2)
          );
          
          if (distanceFromCenter <= exclusionRadius) {
            if (x < centerX) {
              x = random.nextDouble() * (screenWidth * 0.25); 
            } else {
              x = screenWidth * 0.6 + random.nextDouble() * (screenWidth * 0.25);
            }
            
            if (y < centerY) {
              y = random.nextDouble() * (containerHeight * 0.25); 
            } else {
              y = containerHeight * 0.75 + random.nextDouble() * (containerHeight * 0.25);
            }
          }
          
          return {
            'x': x,
            'y': y,
            'size': random.nextDouble() * 28 + 20,
          };
        });
        
        return SizedBox(
          height: containerHeight,
          child: Stack(
            children: [
              ...dotPositions.map((dot) {
                return Positioned(
                  left: dot['x']!,
                  top: dot['y']!,
                  child: Container(
                    width: dot['size']!,
                    height: dot['size']!,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6).withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }),
              Center(
                child: Image.asset(
                  'assets/images/onb3.png',
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: imageSize,
                      height: imageSize,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.redAccent,
                        size: imageSize * 0.4,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    
    final hasSubtitle = subtitle?.isNotEmpty ?? false;
    final isFirstPage = pageIndex == 1;
    
    final titleFontSize = screenWidth < 400 
        ? (isFirstPage ? 26.0 : (hasSubtitle ? 22.0 : 26.0)) 
        : (isFirstPage ? 34.0 : (hasSubtitle ? 28.0 : 32.0)); 
    final subtitleFontSize = screenWidth < 400 
        ? (isFirstPage ? 15.0 : 13.0) 
        : (isFirstPage ? 18.0 : 16.0); 
    final horizontalPadding = screenWidth < 400 ? 16.0 : 24.0;
    
    final illustrationFlex = screenHeight < 700 ? 3 : (isFirstPage ? 4 : 3); 
    final textFlex = screenHeight < 700 ? 2 : (isFirstPage ? 2 : 2); 
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        children: [
          Expanded(
            flex: illustrationFlex,
            child: Padding(
              padding: EdgeInsets.only(
                top: screenHeight < 700 ? 10 : 20,
                bottom: screenHeight < 700 ? 16 : 32,
              ),
              child: _buildIllustration(pageIndex ?? 0),
            ),
          ),
          Expanded(
            flex: textFlex,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
                if (hasSubtitle) ...[
                  SizedBox(height: screenHeight < 700 ? 8 : 16),
                  Text(
                    subtitle!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      height: 1.3,
                      fontSize: subtitleFontSize,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}