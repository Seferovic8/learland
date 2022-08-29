import 'package:learland/_all.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  final _passwordFocusNode = FocusNode();
  final _loginButtFocusNode = FocusNode();
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _loginButtFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // ignore: unused_local_variable
    String email;
    // ignore: unused_local_variable
    String password;
    final double height = mediaQuery.size.height;
    final double width = mediaQuery.size.width;
    void saveForm() {
      FocusScope.of(context).requestFocus(_loginButtFocusNode);
      //! | promijenuti null ovdje
      if (!_form.currentState!.validate()) {
        _form.currentState!.save();
        // context.read<AuthBloc>().add(AuthLoginEvent(authModel: AuthModel(email: email, password: password)));
        context.read<AuthBloc>().add(AuthLoginEvent(authModel: AuthModel(email: 'salihseferovic05@gmail.com', password: 'kucakuca')));
      }
    }

    String? validateEmail(String data) {
      if (data.isEmpty) {
        return 'Unesite email';
      }
      if (!data.isValidEmail()) {
        return 'Provjeri Email';
      }
      return null;
    }

    String? validatePassword(String data) {
      if (data.isEmpty) {
        return 'Unesite lozinku';
      }
      if (data.length < 8) {
        return 'Lozinka mora imati 8 ili više znakova';
      }
      return null;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const _BackgroundCanvas(),
            Positioned(
              height: height - ((height * 0.25) - mediaQuery.viewInsets.bottom * 0.25),
              top: (height * 0.25) - mediaQuery.viewInsets.bottom * 0.25,
              //bottom: 0,
              //widthFactor: .3,
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/img/logo.png'),
                  Container(
                    width: width,
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _form,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            validator: (value) => validateEmail(value as String),
                            decoration: const InputDecoration(labelText: 'E-mail'),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (newValue) => email = newValue as String,
                            onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocusNode),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(labelText: 'Password'),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            autocorrect: false,
                            enableSuggestions: false,
                            validator: (value) => validatePassword(value as String),
                            onSaved: (newValue) => password = newValue as String,
                            onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_loginButtFocusNode),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _ForgetPasswordButton(),
                  _LoginButton(saveForm: saveForm, focusNode: _loginButtFocusNode),
                  _CreateAccountButton(),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                    if (state.status == AuthStateStatus.authenticated) {
                      Navigator.pushReplacementNamed(context, LoadPage.routeName);
                    }
                  }, builder: (context, state) {
                    if (state.status == AuthStateStatus.error) {
                      return _ErrorPrint(
                        width: width,
                        error: state.error as String,
                      );
                    }
                    return Container();
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackgroundCanvas extends StatelessWidget {
  const _BackgroundCanvas();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double width = mediaQuery.size.width;
    final double height = mediaQuery.size.height;
    return SizedBox(
      height: height,
      child: Align(
        // heightFactor: height,
        alignment: Alignment.bottomCenter,
        child: CustomPaint(
          size: Size(width, (width * 1.25).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: LoginPainter(),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.saveForm, required this.focusNode});
  final VoidCallback saveForm;
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
      width: mediaQuery.size.width,
      height: 65,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          focusNode: focusNode,
          onPressed: saveForm,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(32, 148, 238, 1)),
            //backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(0, 102, 242, 1)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
          ),
          child: const Text(
            'Prijavi se',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}

class _ErrorPrint extends StatelessWidget {
  const _ErrorPrint({required this.error, required this.width});
  final String error;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.5 + 10,
      decoration: BoxDecoration(color: const Color.fromRGBO(232, 216, 216, 0.9), borderRadius: BorderRadius.circular(13)),
      height: 50,
      padding: const EdgeInsets.all(8),
      //color: const Color.fromRGBO(232, 216, 216, 0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.error_sharp,
            color: Colors.red,
          ),
          Text(
            error,
            style: const TextStyle(color: Colors.red, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class _ForgetPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: () {},
            child: const Text(
              'Zaboravili ste lozinku?',
              style: TextStyle(fontSize: 16),
            )),
      ),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: () {},
            child: const Text(
              'Kreiraj korisnički račun',
              style: TextStyle(fontSize: 16),
            )),
      ),
    );
  }
}
