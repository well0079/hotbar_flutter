import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// APP PRINCIPAL
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Use Dev',
      theme: ThemeData(
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}

// TELA PRINCIPAL
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      body: Column(
        children: const [
          CustomTopBar(),

          SizedBox(height: 40),

          Text(
            "Conteúdo da página",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// 🔝 TOPBAR
class CustomTopBar extends StatelessWidget {
  const CustomTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          // LINHA SUPERIOR
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // LOGO (USE DEV)
              const Text(
                "USE\nDEV",
                style: TextStyle(
                  fontSize: 16,
                  height: 1,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),

              // MENU DIREITA
              Row(
                children: const [
                  Text(
                    "Sobre nós",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(width: 15),
                  Icon(Icons.person_outline, size: 20),
                  SizedBox(width: 15),
                  Icon(Icons.shopping_cart_outlined, size: 20),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // 🔍 BARRA DE BUSCA
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: const [
                Expanded(
                  child: Text(
                    "O que você procura?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                Icon(Icons.search, color: Colors.black54),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
