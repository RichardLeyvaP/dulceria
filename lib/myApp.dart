import 'package:dulceria/ui/pages/AjudaPage.dart';
import 'package:dulceria/ui/pages/ConfiguracoesPage.dart';
import 'package:dulceria/ui/pages/EstoquePage.dart';
import 'package:dulceria/ui/pages/FuncionariosPage.dart';
import 'package:dulceria/ui/pages/GastosPage.dart';
import 'package:dulceria/ui/pages/HomePageBusines.dart';
import 'package:dulceria/ui/pages/IngresosPage.dart';
import 'package:dulceria/ui/pages/PedidosPage.dart';
import 'package:dulceria/ui/pages/PromocoesPage.dart';
import 'package:dulceria/ui/pages/ReceitasPage.dart';
import 'package:dulceria/ui/pages/RelatoriosPage.dart';
import 'package:dulceria/ui/pages/registerPage.dart';
import 'package:dulceria/utils/utilClass.dart';
import 'package:dulceria/utils/utilsStyleGlobalApk.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:signals/signals_flutter.dart';


// TranslationManager.loadDefaultTranslations(languageCode);

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Configuración de rutas con GoRouter
  final GoRouter _appRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) => '/SignUpPage',
        // redirect: (context, state) => '/SignUpPage',
      ),
     
      // GoRoute(
      //   path: '/LoginFbPage',
      //   builder: (context, state) => LoginFbPage(),
      // ),
      // GoRoute(
      //   path: '/LoginFormPage',
      //   builder: (context, state) => const LoginFormPage(),
      // ),
    
      
      GoRoute(
        path: '/SignUpPage',
        builder: (context, state) => SignUpPage(),
      ),
      GoRoute(
        path: '/HomePageBusines',
        builder: (context, state) => HomePageBusines(),
      ),
      GoRoute(
        path: '/FuncionariosPage',
        builder: (context, state) => FuncionariosPage(),
      ),
      GoRoute(
        path: '/GastosPage',
        builder: (context, state) => GastosPage(),
      ),
      GoRoute(
        path: '/IngresosPage',
        builder: (context, state) => IngresosPage(),
      ),
      GoRoute(
        path: '/ReceitasPage',
        builder: (context, state) => ReceitasPage(),
      ),
      GoRoute(
        path: '/EstoquePage',
        builder: (context, state) => EstoquePage(),
      ),
      GoRoute(
        path: '/PedidosPage',
        builder: (context, state) => PedidosPage(),
      ),
      GoRoute(
        path: '/RelatoriosPage',
        builder: (context, state) => RelatoriosPage(),
      ),
      GoRoute(
        path: '/PromocoesPage',
        builder: (context, state) => PromocoesPage(),
      ),
      GoRoute(
        path: '/ConfiguracoesPage',
        builder: (context, state) => ConfiguracoesPage(),
      ),
      GoRoute(
        path: '/AjudaPage',
        builder: (context, state) => AjudaPage(),
      ),
      
      
       //rutas de prueba
      //
      //
      //
      //
      // Agrega más rutas según sea necesario
    ],
  );

  // Configuración del tema
  ThemeData themeDataInitialSmall() {
    return ThemeData(
      fontFamily: StyleGlobalApk.globalTextStyle.fontFamily,
      primaryColor: const Color.fromARGB(255, 67, 162, 240),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: StyleGlobalApk.colorPrimary,
        secondary: Colors.orange,
        surface: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 120,
        backgroundColor: StyleGlobalApk.colorPrimary,
        titleTextStyle: StyleGlobalApk.globalTextStyle.copyWith(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: StyleGlobalApk.globalTextStyle.copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        titleLarge: StyleGlobalApk.globalTextStyle.copyWith(
          fontSize: 46.0,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        titleMedium: StyleGlobalApk.globalTextStyle.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        titleSmall: StyleGlobalApk.globalTextStyle.copyWith(
          fontSize: 10.0,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        displayMedium: StyleGlobalApk.getStyleTitleApk().copyWith(
          color: StyleGlobalApk.getColorIndicador(),
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(StyleGlobalApk.colorPrimary),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          textStyle: WidgetStateProperty.all<TextStyle>(
            StyleGlobalApk.globalTextStyle.copyWith(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintStyle: StyleGlobalApk.globalTextStyle.copyWith(
          fontSize: 12.0,
          color: Colors.grey,
          fontWeight: FontWeight.normal,
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            color: StyleGlobalApk.colorPrimary,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String languageCode = 'es'; // Valor por defecto
   

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeDataInitialSmall(),
      routerConfig: _appRouter,
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: TranslationManager.supportedLocales,
      // locale: TranslationManager.getCurrentApi(languageCode),
    );
  }
}
