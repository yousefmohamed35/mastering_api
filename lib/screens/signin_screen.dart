import 'package:api/cubit/user_cubit.dart';
import 'package:api/cubit/user_state.dart';
import 'package:api/screens/profile_screen.dart';
import 'package:api/widgets/custom_form_button.dart';
import 'package:api/widgets/custom_input_field.dart';
import 'package:api/widgets/dont_have_an_account.dart';
import 'package:api/widgets/forget_password.dart';
import 'package:api/widgets/page_header.dart';
import 'package:api/widgets/page_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login Successful'),
              ),
            );
          } else if (state is Userfailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffEEF1F3),
            body: Column(
              children: [
                const PageHeader(),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: context.read<UserCubit>().signInFormKey,
                        child: Column(
                          children: [
                            const PageHeading(title: 'Sign-in'),
                            //!Email
                            CustomInputField(
                              labelText: 'Email',
                              hintText: 'Your email',
                              controller: context.read<UserCubit>().signInEmail,
                            ),
                            const SizedBox(height: 16),
                            //!Password
                            CustomInputField(
                              labelText: 'Password',
                              hintText: 'Your password',
                              obscureText: true,
                              suffixIcon: true,
                              controller:
                                  context.read<UserCubit>().signInPassword,
                            ),
                            const SizedBox(height: 16),
                            //! Forget password?
                            ForgetPasswordWidget(size: size),
                            const SizedBox(height: 20),
                            //!Sign In Button
                            state is UserLoading
                                ? const CircularProgressIndicator()
                                : CustomFormButton(
                                    innerText: 'Sign In',
                                    onPressed: () {
                                      context.read<UserCubit>().SignIn();
                                      /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileScreen(),
                                  ),
                                );*/
                                    },
                                  ),
                            const SizedBox(height: 18),
                            //! Dont Have An Account ?
                            DontHaveAnAccountWidget(size: size),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
