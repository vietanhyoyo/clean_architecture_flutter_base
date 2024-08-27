// ignore_for_file: use_build_context_synchronously

import 'package:clean_architecture/config/routes/application.dart';
import 'package:clean_architecture/config/routes/routes.dart';
import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/app_text_style.dart';
import 'package:clean_architecture/core/utils/widgets/reusable_input.dart';
import 'package:clean_architecture/features/shopping/data/data_sources/local/storage.dart';
import 'package:clean_architecture/features/shopping/domain/usecases/post_login_usecase.dart';
import 'package:clean_architecture/injection_container.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final PostLoginUseCase _postLoginUseCase = PostLoginUseCase(sl());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void hanlerSubmit(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;
    Application.navigateTo(
              context, Routes.shoppingHome, TransitionType.fadeIn);

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final data = await _postLoginUseCase(
            params: {"email": email, "password": password});
        if (data.data != null) {
          await Storage.saveAccessToken(data.data!.accessToken ?? "");
          print(Storage.getAccessToken());
          Application.navigateTo(
              context, Routes.shoppingHome, TransitionType.fadeIn);
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Form(
                child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: AppColors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Shopping", style: AppText.titlePrimaryLG),
                    const SizedBox(height: 32.0),
                    ReusableInput(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Email không hợp lệ';
                        }
                        return null;
                      },
                      labelText: 'Email',
                      hintText: 'Enter your email',
                    ),
                    const SizedBox(height: 16.0),
                    ReusableInput(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập mật khẩu';
                        } else if (value.length < 6) {
                          return 'Mật khẩu phải có ít nhất 6 ký tự';
                        }
                        return null;
                      },
                      labelText: 'Password',
                      hintText: 'Enter your password',
                    ),
                    const SizedBox(height: 32.0),
                    ElevatedButton(
                      onPressed: () => hanlerSubmit(context),
                      child: const Text('Login'),
                    )
                  ],
                ),
              ),
            )),
          ),
        ),
        Positioned(
          top: 60,
          left: 0,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ), // Icon quay lại
            onPressed: () {
              Navigator.pop(context); // Trở về trang trước
            },
          ),
        )
      ],
    );
  }
}
