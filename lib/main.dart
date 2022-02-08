import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_flutter/features/presentation/bloc/auth/auth_cubit.dart';
import 'package:my_notes_flutter/features/presentation/bloc/auth/auth_state.dart';
import 'package:my_notes_flutter/features/presentation/bloc/note/note_cubit.dart';
import 'package:my_notes_flutter/features/presentation/bloc/user/user_cubit.dart';
import 'package:my_notes_flutter/features/presentation/pages/signin_page.dart';
import 'package:my_notes_flutter/on_generate_routes.dart';
import 'features/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (_) => di.getIt<AuthCubit>()..appStarted()),
        BlocProvider<UserCubit>(create: (_) => di.getIt<UserCubit>()),
        BlocProvider<NoteCubit>(create: (_) => di.getIt<NoteCubit>()),
      ],
      child: MaterialApp(
        title: 'My Notes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
        initialRoute: '/',
        onGenerateRoute: OnGenerateRoute.route,
        routes: {
          '/': (context) {
            return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
              if (authState is AuthenticationState) {
                HomePage(uid: '',);
              }
              if (authState is UnAuthenticationState) {
                return SignInPage();
              }

              return CircularProgressIndicator();
            });
          }
        },
      ),
    );
  }
}
