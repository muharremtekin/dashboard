import 'package:flutter/material.dart';

class SlideInMenuApp extends StatefulWidget {
  const SlideInMenuApp({super.key});

  @override
  _SlideInMenuAppState createState() => _SlideInMenuAppState();
}

class _SlideInMenuAppState extends State<SlideInMenuApp> {
  bool _isMenuOpen = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide-in Menü Örneği'),
      ),
      body: Stack(
        children: [
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: _toggleMenu,
                child: const Text('Menüyü Aç/Kapat'),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            top: 0,
            bottom: 0,
            right: _isMenuOpen
                ? 0
                : -150, // Menü açıkken sağdan gelir, kapalıyken ekranın dışına kayar
            child: Container(
              width: 150,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: const Text('Anasayfa',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Menü öğelerine tıklama işlemleri burada gerçekleştirilebilir
                      _toggleMenu();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.white),
                    title: const Text('Ayarlar',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      _toggleMenu();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
