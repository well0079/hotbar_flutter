import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// App principal
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotbar App',
      theme: ThemeData.dark(),
      home: const MainPage(),
    );
  }
}

// Tela principal com navegação
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    Center(child: Text("Home")),
    Center(child: Text("Busca")),
    Center(child: Text("Perfil")),
  ];

  void changeTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CustomHotbar(
        currentIndex: currentIndex,
        onTap: changeTab,
      ),
    );
  }
}

// Hotbar personalizada
class CustomHotbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomHotbar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  Widget buildItem(IconData icon, int index) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
          size: 26,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildItem(Icons.home, 0),
            buildItem(Icons.search, 1),
            buildItem(Icons.person, 2),
          ],
        ),
      ),
    );
  }
}