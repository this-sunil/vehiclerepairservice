import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_repair_service/layer/Widget/LoadingButtonIndicator.dart';

import '../../core/Bloc/AuthBloc/AuthBloc.dart';
import '../../core/Routes/route.dart';
import '../../layer/Widget/CustomHelper.dart';
import '../../layer/Widget/CustomInputText.dart';
import '../../layer/Widget/Storage.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin, CustomHelperMixin {
  late final TextEditingController phone;
  late final TextEditingController pass;

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  late final AnimationController _opacityController;
  late final Animation<double> _opacityAnimation;

  late final AnimationController _slideController;
  late final Animation<Offset> _slideAnimation;

  late final AnimationController rotateController;
  late final Animation<double> rotateAnimation;

  late final AnimationController bounceController;
  late final Animation<Offset> leftSlideAnimation;
  late final Animation<Offset> rightSlideAnimation;

  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  bool visiblePass = true;

  static const Color backgroundColor = Color(0xFF090B1A);
  static const Color primaryColor = Color(0xFF6D4AFF);
  static const Color secondaryColor = Color(0xFF8B5CF6);
  static const Color headingColor = Color(0xFF17152B);

  @override
  void initState() {
    super.initState();

    phone = TextEditingController();
    pass = TextEditingController();

    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );

    _opacityAnimation = CurvedAnimation(
      parent: _opacityController,
      curve: Curves.easeInOut,
    );

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.18), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    rotateAnimation = Tween<double>(begin: -0.04, end: 0).animate(
      CurvedAnimation(parent: rotateController, curve: Curves.easeOutBack),
    );

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

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.97, end: 1.04).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _opacityController.forward();
    _slideController.forward();
    rotateController.forward();
  }

  @override
  void dispose() {
    phone.dispose();
    pass.dispose();

    _opacityController.dispose();
    _slideController.dispose();
    rotateController.dispose();
    bounceController.dispose();
    _pulseController.dispose();

    super.dispose();
  }

  Widget _buildGlow({required double size, required Color color}) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: 0.10),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.13),
              blurRadius: 75,
              spreadRadius: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: ScaleTransition(
        scale: _pulseAnimation,
        child: RotationTransition(
          turns: rotateAnimation,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: const Color(0xFFA78BFA), width: 2),
              boxShadow: [
                BoxShadow(
                  color: secondaryColor.withValues(alpha: 0.30),
                  blurRadius: 30,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: ClipOval(
              child: customImage(
                path: logoIcon,
                width: 112,
                height: 112,
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
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          children: [
            const Text(
              'Welcome Back',
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
              'Sign in to continue to your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.68),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return CustomInputText(
      controller: phone,
      textInputType: TextInputType.phone,
      prefixIcon: const Icon(Icons.phone_iphone_rounded, color: primaryColor),
      validator: (value) {
        final input = value?.trim() ?? '';

        if (input.isEmpty) {
          return 'Enter phone number';
        }

        if (input.length != 10) {
          return 'Enter a valid 10-digit number';
        }

        return null;
      },
      hintText: 'Enter phone number',
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
        },
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: RotationTransition(
                turns: Tween<double>(begin: 0.85, end: 1).animate(animation),
                child: child,
              ),
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

  Widget _buildLoginButton() {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state.status == AuthStatus.login) {
          final token = state.result?.token;
          final userId = state.result?.result?.id;

          if (token == null || userId == null) {
            return;
          }

          await Storage.instance.setToken(token.toString());
          await Storage.instance.setUId(userId.toString());

          if (!context.mounted) return;

          context.pushAndRemoveUntil(AppRoute.dashboard);
        }
      },
      builder: (context, state) {
        final isLoading = state.status == AuthStatus.loading;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: double.infinity,
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withValues(alpha: isLoading ? 0.05 : 0.25),
                blurRadius: isLoading ? 4 : 18,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    final isValid = loginKey.currentState?.validate() ?? false;

                    if (!isValid) return;

                    FocusScope.of(context).unfocus();

                    context.read<AuthBloc>().add(
                      LoginEvent(phone: phone.text.trim(), pass: pass.text),
                    );
                  },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: primaryColor,
              disabledBackgroundColor: primaryColor.withValues(alpha: 0.65),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: isLoading
                  ? const SizedBox(
                      key: ValueKey('loading'),
                      height: 24,
                      width: 24,
                      child: LoadingButtonIndicator(),
                    )
                  : const Row(
                      key: ValueKey('login'),
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_rounded, size: 20),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRegisterLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            "Don't have an account?",
            style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
          ),
        ),
        TextButton(
          onPressed: () {
            context.pushReplace(AppRoute.register);
          },
          style: TextButton.styleFrom(foregroundColor: primaryColor),
          child: const Text(
            'Register',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginCard() {
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
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: headingColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Enter your credentials below',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 26),
          _buildPhoneField(),
          const SizedBox(height: 16),
          _buildPasswordField(),
          const SizedBox(height: 24),
          _buildLoginButton(),
          const SizedBox(height: 16),
          _buildRegisterLink(),
        ],
      ),
    );
  }

  Widget _buildDecorativeCircle({
    required double size,
    required List<Color> colors,
    required Color shadowColor,
  }) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withValues(alpha: 0.22),
              blurRadius: 22,
              spreadRadius: 2,
            ),
          ],
        ),
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
          Positioned(
            top: -100,
            right: -90,
            child: _buildGlow(size: 280, color: const Color(0xFF7C3AED)),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: _buildGlow(size: 300, color: const Color(0xFF06B6D4)),
          ),
          Positioned(
            top: 85,
            left: 18,
            child: SlideTransition(
              position: leftSlideAnimation,
              child: _buildDecorativeCircle(
                size: 44,
                colors: const [Color(0xFF8B5CF6), Color(0xFFEC4899)],
                shadowColor: secondaryColor,
              ),
            ),
          ),
          Positioned(
            bottom: 95,
            right: 22,
            child: SlideTransition(
              position: rightSlideAnimation,
              child: _buildDecorativeCircle(
                size: 55,
                colors: const [Color(0xFF06B6D4), Color(0xFF6366F1)],
                shadowColor: Color(0xFF06B6D4),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 28,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  child: Form(
                    key: loginKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLogo(),
                        const SizedBox(height: 28),
                        _buildHeading(),
                        const SizedBox(height: 30),
                        SlideTransition(
                          position: _slideAnimation,
                          child: FadeTransition(
                            opacity: _opacityAnimation,
                            child: _buildLoginCard(),
                          ),
                        ),
                        const SizedBox(height: 24),
                        FadeTransition(
                          opacity: _opacityAnimation,
                          child: Text(
                            'SECURE LOGIN  •  VEHICLE REPAIR SERVICE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.45),
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
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
