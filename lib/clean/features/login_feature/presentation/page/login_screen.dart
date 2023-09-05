import 'package:flutter/material.dart';

import '../../../register_feature/presentation/page/register_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'LOGIN',
              style: Theme.of(context).textTheme.headline5,
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
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
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
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                  ),
                  suffixIcon: const Icon(
                    Icons.visibility_outlined,
                  ),
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
            Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed: () {}, child: Text('login'.toUpperCase()))),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
               const Text('Don\'t have an account?') ,
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterScreen()));
                }, child: Text('register'.toUpperCase())),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
