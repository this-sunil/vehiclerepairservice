import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vehicle_repair_service/layer/Widget/LoadingButtonIndicator.dart';

import '../../core/Bloc/AuthBloc/AuthBloc.dart';
import '../../core/Routes/route.dart';
import '../../layer/Widget/CustomHelper.dart';
import '../../layer/Widget/CustomInputText.dart';
import '../../layer/Widget/Storage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with CustomHelperMixin, TickerProviderStateMixin {
  late final TextEditingController name;
  late final TextEditingController phone;
  late final TextEditingController pass;

  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  bool visiblePass = true;

  late final AnimationController _opacityController;
  late final Animation<double> _opacityAnimation;

  late final AnimationController _slideController;
  late final Animation<Offset> _slideAnimation;

  late final AnimationController rotateController;
  late final Animation<double> rotateAnimation;

  late final AnimationController bounceController;
  late final Animation<Offset> leftSlideAnimation;
  late final Animation<Offset> rightSlideAnimation;

  late final AnimationController _passwordController;
  late final Animation<double> _passwordIconAnimation;

  static const Color backgroundColor = Color(0xFF090B1A);
  static const Color primaryColor = Color(0xFF6D4AFF);
  static const Color secondaryColor = Color(0xFF8B5CF6);
  static const Color headingColor = Color(0xFF17152B);

  @override
  void initState() {
    super.initState();

    name = TextEditingController();
    phone = TextEditingController();
    pass = TextEditingController();

    // Fade-in animation
    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _opacityAnimation = CurvedAnimation(
      parent: _opacityController,
      curve: Curves.easeInOut,
    );

    _opacityController.forward();

    // Registration card slide-up animation
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.20), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    _slideController.forward();

    // Continuous slow logo rotation
    rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();

    rotateAnimation = Tween<double>(begin: 0, end: 1).animate(rotateController);

    // Floating background circles
    bounceController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    leftSlideAnimation =
        Tween<Offset>(
          begin: const Offset(-0.12, -0.12),
          end: const Offset(0.08, 0.08),
        ).animate(
          CurvedAnimation(parent: bounceController, curve: Curves.easeInOut),
        );

    rightSlideAnimation =
        Tween<Offset>(
          begin: const Offset(0.12, 0.12),
          end: const Offset(-0.08, -0.08),
        ).animate(
          CurvedAnimation(parent: bounceController, curve: Curves.easeInOut),
        );

    // Animated password visibility icon
    _passwordController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );

    _passwordIconAnimation = CurvedAnimation(
      parent: _passwordController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    pass.dispose();

    _opacityController.dispose();
    _slideController.dispose();
    rotateController.dispose();
    bounceController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Widget _buildGlow({required double size, required Color color}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.12),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.12),
            blurRadius: 70,
            spreadRadius: 18,
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: RotationTransition(
        turns: rotateAnimation,
        child: RippleAnimation(
          color: secondaryColor,
          duration: const Duration(seconds: 3),
          repeat: true,
          ripplesCount: 3,
          minRadius: 90,
          maxRadius: 140,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: const Color(0xFFA78BFA), width: 2),
              boxShadow: [
                BoxShadow(
                  color: secondaryColor.withValues(alpha: 0.3),
                  blurRadius: 28,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: ClipOval(
              child: customImage(
                path: logoIcon,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                radius: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeading() {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: Column(
        children: [
          const Text(
            'Create Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Join us and get started today',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.68),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return CustomInputText(
      controller: name,
      prefixIcon: const Icon(Icons.person_outline_rounded, color: primaryColor),
      textInputType: TextInputType.name,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Enter your name';
        }
        return null;
      },
      hintText: 'Enter your full name',
      onChanged: (_) {},
      inputFormatter: const [],
    );
  }

  Widget _buildPhoneField() {
    return CustomInputText(
      controller: phone,
      prefixIcon: const Icon(Icons.phone_iphone_rounded, color: primaryColor),
      textInputType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter phone number';
        }
        if (value.length != 10) {
          return 'Enter a valid 10-digit number';
        }
        return null;
      },
      hintText: 'Enter phone number',
      maxLength: 10,
      onChanged: (_) {},
      inputFormatter: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
    );
  }

  Widget _buildPasswordField() {
    return CustomInputText(
      controller: pass,
      obscureText: visiblePass,
      textInputType: TextInputType.visiblePassword,
      prefixIcon: const Icon(Icons.lock_outline_rounded, color: primaryColor),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            visiblePass = !visiblePass;
          });

          if (visiblePass) {
            _passwordController.reverse();
          } else {
            _passwordController.forward();
          }
        },
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: Icon(
            visiblePass
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            key: ValueKey<bool>(visiblePass),
            color: Colors.grey.shade700,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      hintText: 'Enter password',
      onChanged: (_) {},
      inputFormatter: const [],
    );
  }

  Widget _buildRegisterButton() {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state.status == AuthStatus.register) {
          final token = state.result?.token;
          final userId = state.result?.result?.id;

          if (token == null || userId == null) {
            return;
          }

          await Storage.instance.setUId(userId.toString());
          await Storage.instance.setToken(token.toString());

          if (!context.mounted) return;

          context.pushAndRemoveUntil(AppRoute.dashboard);
        }
      },
      builder: (context, state) {
        if (state.status == AuthStatus.loading) {
          return const SizedBox(
            height: 52,
            child: Center(child: LoadingButtonIndicator()),
          );
        }

        return SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              final isValid = registerKey.currentState?.validate() ?? false;

              if (!isValid) return;

              FocusScope.of(context).unfocus();

              context.read<AuthBloc>().add(
                RegisterEvent(
                  name: name.text.trim(),
                  phone: phone.text.trim(),
                  pass: pass.text,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              elevation: 4,
              shadowColor: primaryColor.withValues(alpha: 0.35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create Account',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward_rounded, size: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            'Already have an account?',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
          ),
        ),
        TextButton(
          onPressed: () {
            context.pushReplace(AppRoute.login);
          },
          child: const Text(
            'Login',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFDFDFF),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Colors.white.withValues(alpha: 0.75)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 35,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Register',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: headingColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Fill in your details to get started',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),
          _buildNameField(),
          const SizedBox(height: 16),
          _buildPhoneField(),
          const SizedBox(height: 16),
          _buildPasswordField(),
          const SizedBox(height: 24),
          _buildRegisterButton(),
          const SizedBox(height: 14),
          _buildLoginLink(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Full-screen gradient background
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF090B1A),
                    Color(0xFF17113B),
                    Color(0xFF10182D),
                    Color(0xFF080A16),
                  ],
                ),
              ),
            ),
          ),

          // Top purple ambient glow
          Positioned(
            top: -110,
            right: -100,
            child: _buildGlow(size: 280, color: const Color(0xFF7C3AED)),
          ),

          // Bottom cyan ambient glow
          Positioned(
            bottom: -110,
            left: -100,
            child: _buildGlow(size: 300, color: const Color(0xFF06B6D4)),
          ),

          // Floating purple circle
          Positioned(
            top: 85,
            left: 20,
            child: SlideTransition(
              position: leftSlideAnimation,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: secondaryColor.withValues(alpha: 0.3),
                      blurRadius: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Floating cyan circle
          Positioned(
            bottom: 100,
            right: 24,
            child: SlideTransition(
              position: rightSlideAnimation,
              child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF06B6D4), Color(0xFF6366F1)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF06B6D4).withValues(alpha: 0.2),
                      blurRadius: 22,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Responsive animated registration content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 28,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  child: Form(
                    key: registerKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLogo(),
                        const SizedBox(height: 26),
                        _buildHeading(),
                        const SizedBox(height: 28),

                        // Animated registration card
                        SlideTransition(
                          position: _slideAnimation,
                          child: _buildRegisterCard(),
                        ),

                        const SizedBox(height: 24),

                        FadeTransition(
                          opacity: _opacityAnimation,
                          child: Text(
                            'SECURE REGISTRATION  •  VEHICLE REPAIR SERVICE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.45),
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
