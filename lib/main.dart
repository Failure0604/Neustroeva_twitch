import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TWITCH App',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Индекс активной вкладки нижнего меню

  //иконки нижнего меню
  final List<IconData> _bottomNavIcons = [
    Icons.home,
    Icons.search,
    Icons.add,
    Icons.notifications,
    Icons.person,
  ];

  //названия нижнего меню
  final List<String> _bottomNavLabels = [
    'Главная',
    'Просмотр',
    ' ',
    'Действия',
    'Профиль',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Stack(
            children: [
              Positioned.fill(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // Фон для первой вкладки "Отслеживаемое"
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/подложка.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Фон для второй вкладки "В эфире"
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/фоновый стрим.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Фон для третьей вкладки
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/фон клипы.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // вкладки
              Column(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TabBar(
                      tabs: [
                        Tab(
                          child: Container(
                            padding: const EdgeInsets.only(left: 3, right: 12),
                            child: const Text(
                              'Отслеживаемое',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: const Text(
                              'В эфире',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: const Text(
                              'Клипы',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                      indicatorColor: Colors.white,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                    ),
                  ),
                  // Контент вкладок
                  Expanded(
                    child: TabBarView(
                      children: [
                        // "Отслеживаемое"
                        SingleChildScrollView(
                          padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'В эфире',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 100),
                              Center(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/icons/они вернутся.png',
                                      width: 88,
                                      height: 88,
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'Они вернутся!',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'А пока изучите ленту, чтобы найти другой контент, который может вас заинтересовать!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 100),
                              const Text(
                                'Категории',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 30),
                              // категории
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _buildCategoryCard(
                                    image: 'assets/icons/дота главная.png',
                                    title: 'Dota 2',
                                    viewers: '15,4 тыс.',
                                  ),
                                  const SizedBox(width: 2),
                                  _buildCategoryCard(
                                    image: 'assets/icons/симс главная.png',
                                    title: 'The Sims 4',
                                    viewers: '374',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // "В эфире"
                        Stack(
                          children: [
                            // стрим
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.4 - 325,
                              left: 0,
                              right: 0,
                              child: Image.asset(
                                'assets/icons/стрим.png',
                                width: 500,
                                height: 350,
                              ),
                            ),
                            // Uniquee
                            const Positioned(
                              left: 7,
                              bottom: 40,
                              child: Image(
                                image: AssetImage('assets/icons/Uniquee.png'),
                                width: 300,
                                height: 150,
                              ),
                            ),
                            // дота2
                            const Positioned(
                              left: 7,
                              bottom: 35,
                              child: Image(
                                image: AssetImage('assets/icons/дота2 в эфире.png'),
                                width: 80,
                                height: 30,
                              ),
                            ),
                            // отслеживать
                            const Positioned(
                              left: 100,
                              bottom: 75,
                              child: Image(
                                image: AssetImage('assets/icons/отслеживать.png'),
                                width: 160,
                                height: 160,
                              ),
                            ),
                            // настройки
                            const Positioned(
                              left: 250,
                              bottom: 40,
                              child: Image(
                                image: AssetImage('assets/icons/иконки справа.png'),
                                width: 225,
                                height: 225,
                              ),
                            ),
                          ],
                        ),
                        // "Клипы"
                        Stack(
                          children: [
                            // AMOR_ED
                            const Positioned(
                              left: 7,
                              bottom: 40,
                              child: Image(
                                image: AssetImage('assets/icons/AMOR_ED.png'),
                                width: 300,
                                height: 150,
                              ),
                            ),
                            // дота2
                            const Positioned(
                              left: 7,
                              bottom: 35,
                              child: Image(
                                image: AssetImage('assets/icons/дота2 в эфире.png'),
                                width: 80,
                                height: 30,
                              ),
                            ),
                            // отслеживать
                            const Positioned(
                              left: 120,
                              bottom: 62,
                              child: Image(
                                image: AssetImage('assets/icons/отслеживать.png'),
                                width: 160,
                                height: 160,
                              ),
                            ),
                            // настройки
                            const Positioned(
                              left: 250,
                              bottom: 40,
                              child: Image(
                                image: AssetImage('assets/icons/иконки справа клипы.png'),
                                width: 225,
                                height: 225,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // нижнее меню
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: const Color.fromARGB(255, 107, 44, 202),
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: List.generate(
          _bottomNavIcons.length,
          (index) {
            if (index == 2) {
              return BottomNavigationBarItem(
                // подложка под +
                icon: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 29, 29, 29),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(8),
                  width: 58,
                  height: 42,
                  child: Icon(
                    _bottomNavIcons[index],
                    color: Colors.white,
                  ),
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 29, 29, 29),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(8),
                  width: 58,
                  height: 42,
                  child: Icon(
                    _bottomNavIcons[index],
                    color: const Color.fromARGB(255, 107, 44, 202),
                  ),
                ),
                label: _bottomNavLabels[index],
              );
            } else {
              return BottomNavigationBarItem(
                icon: Icon(
                  _bottomNavIcons[index],
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  _bottomNavIcons[index],
                  color: const Color.fromARGB(255, 107, 44, 202),
                ),
                label: _bottomNavLabels[index],
              );
            }
          },
        ),
        selectedLabelStyle: const TextStyle(color: Color.fromARGB(255, 107, 44, 202)),
        unselectedLabelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }

  // карточки категории
  Widget _buildCategoryCard({
    required String image,
    required String title,
    required String viewers,
  }) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.zero,
            child: Image.asset(
              image,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.circle, size: 10, color: Colors.red),
                    const SizedBox(width: 4),
                    Text(
                      viewers,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}