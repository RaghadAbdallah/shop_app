import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/clean/features/login_feature/presentation/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../register_feature/presentation/page/register_page.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          if (state.model.status == false) {
            Fluttertoast.showToast(
                msg:state.model.message??'',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Colors.black),
                      ),
                      Text(
                        'login now to browse our hot offers',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return 'PLease enter your email address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(),
                            ),
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                            ),
                            label: const Text(
                              'Email Address',
                              style: TextStyle(
                                fontFamily: 'Abel',
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText:
                            context.read<LoginCubit>().getIsVisiblePassword,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return 'Your password too short';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  context
                                          .read<LoginCubit>()
                                          .setIsVisiblePassword =
                                      !context
                                          .read<LoginCubit>()
                                          .getIsVisiblePassword;
                                },
                                icon: Icon(context
                                        .read<LoginCubit>()
                                        .getIsVisiblePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined)),
                            label: const Text(
                              'Password',
                              style: TextStyle(
                                fontFamily: 'Abel',
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  context.read<LoginCubit>().getLoginSuccess(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              child: Text('login'.toUpperCase()))),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen()));
                              },
                              child: Text('register'.toUpperCase())),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
