import 'package:flutter/material.dart';

// Zodiac Model
class Zodiac {
  final String imagePath;
  final String name;
  final String dateRange;
  final String description;

  Zodiac({
    required this.imagePath,
    required this.name,
    required this.dateRange,
    required this.description,
  });
}

// MyNavBarPage
class MyNavBarPage extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  MyNavBarPage({required this.selectedIndex, required this.onItemTapped});

  final List<Map<String, String>> navItems = [
    {'iconPath': 'assets/menu/today.png', 'label': 'Өнөөдөр'},
    {'iconPath': 'assets/menu/month.png', 'label': 'Сар'},
    {'iconPath': 'assets/menu/orduud.png', 'label': 'Хослол'},
    {'iconPath': 'assets/menu/hoslol.png', 'label': 'Ордууд'},
    {'iconPath': 'assets/menu/profile.png', 'label': 'Профайл'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: const Color(0xFFF8B9FF),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: const Offset(0, -2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(navItems.length, (index) {
          final item = navItems[index];
          return _buildNavItem(
              context, item['iconPath']!, item['label']!, index);
        }),
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, String iconPath, String label, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        onItemTapped(index);

        if (index == 0) Navigator.pushNamed(context, '/today');
        if (index == 1) Navigator.pushNamed(context, '/planet');
        if (index == 2) Navigator.pushNamed(context, '/hoslol');
        if (index == 3) Navigator.pushNamed(context, '/orduud');
        if (index == 4) Navigator.pushNamed(context, '/profile');
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isSelected ? 40 : 30,
            height: isSelected ? 40 : 30,
            child: Image.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 6),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isSelected ? 1 : 0.7,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: isSelected ? const Color(0xFF0A0E21) : Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// ZodiacPage
class ZodiacPage extends StatelessWidget {
  const ZodiacPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Zodiac> zodiacs = [
      Zodiac(
        imagePath: 'assets/aries.png',
        name: 'Хонь',
        dateRange: '3/21 - 4/19',
        description: 'Хонь – “Гал” махбодитой ордуудаас хамгийн гал цогтой нь юм.',
      ),
      Zodiac(
        imagePath: 'assets/taurus.png',
        name: 'Үхэр',
        dateRange: '4/20 - 5/20',
        description: 'Үхрийн ордод төрсөн хүмүүс ерөнхийдөө дуугуй, бие даасан, хариуцлагатай.',
      ),
      Zodiac(
        imagePath: 'assets/gemini.png',
        name: 'Хамхи',
        dateRange: '5/21 - 6/20',
        description: 'Хамхины ордод төрсөн хүмүүс ухаалаг, зохион байгуулалттай, сэтгэл санааны өөрчлөлттэй байдаг.',
      ),
      Zodiac(
        imagePath: 'assets/cancer.png',
        name: 'Мэлхий',
        dateRange: '6/21 - 7/22',
        description: 'Мэлхийн ордод төрсөн хүмүүс халамжтай, сэтгэл татам, санаачлагатай.',
      ),
      Zodiac(
        imagePath: 'assets/leo.png',
        name: 'Арслан',
        dateRange: '7/23 - 8/22',
        description: 'Арслангийн ордод төрсөн хүмүүс эрэлхийлэгч, тэргүүлэгч, өөртөө итгэлтэй байдаг.',
      ),
      Zodiac(
        imagePath: 'assets/virgo.png',
        name: 'Охин',
        dateRange: '8/23 - 9/22',
        description: 'Охины ордод төрсөн хүмүүс бүтээлч, нарийн төвөгтэй, сэтгэл санаа өндөр байдаг.',
      ),
      Zodiac(
        imagePath: 'assets/libra.png',
        name: 'Жинлүүр',
        dateRange: '9/23 - 10/22',
        description: 'Жинлүүрийн ордод төрсөн хүмүүс тэвчээртэй, шударга, харилцааны авьяастай.',
      ),
      Zodiac(
        imagePath: 'assets/scorpio.png',
        name: 'Хилэнц',
        dateRange: '10/23 - 11/21',
        description: 'Хилэнцийн ордод төрсөн хүмүүс хүчтэй, хүсэл тэмүүлэлтэй, амьдралын төлөө тэмцэгч байдаг.',
      ),
      Zodiac(
        imagePath: 'assets/sagittarius.png',
        name: 'Нум',
        dateRange: '11/22 - 12/21',
        description: 'Нумын ордод төрсөн хүмүүс тууштай, зоригтой, байгалийн урлагтай байдаг.',
      ),
      Zodiac(
        imagePath: 'assets/capricorn.png',
        name: 'Матар',
        dateRange: '12/22 - 1/19',
        description: 'Матарт төрсөн хүмүүс тууштай, хариуцлагатай, амжилттай ажиллахыг хүсдэг.',
      ),
      Zodiac(
        imagePath: 'assets/aquarius.png',
        name: 'Хумх',
        dateRange: '1/20 - 2/18',
        description: 'Хумхын ордод төрсөн хүмүүс илтгэлцлийн хүчтэй, шинжлэх ухаан болон урлагт ихээхэн сонирхолтой.',
      ),
      Zodiac(
        imagePath: 'assets/pisces.png',
        name: 'Загас',
        dateRange: '2/19 - 3/20',
        description: 'Загасны ордод төрсөн хүмүүс сайхан сэтгэлтэй, хурц сэтгэхүйтэй, уран бүтээлч байдаг.',
      ),
    ];


    return Scaffold(
      appBar: AppBar(
        title: const Text('Ордууд'),
        backgroundColor: const Color(0xFFF4B0F9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: zodiacs.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ZodiacDetailPage(zodiac: zodiacs[index]),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF0C0E2F),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(zodiacs[index].imagePath),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    zodiacs[index].name,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF4B0F9),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: MyNavBarPage(
        selectedIndex: 3,
        onItemTapped: (index) {
          print('Tapped index: $index');
        },
      ),
    );
  }
}

// ZodiacDetailPage
class ZodiacDetailPage extends StatelessWidget {
  final Zodiac zodiac;

  const ZodiacDetailPage({required this.zodiac, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(zodiac.name),
        backgroundColor: const Color(0xFFF4B0F9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(zodiac.imagePath),
            const SizedBox(height: 16.0),
            Text(
              zodiac.dateRange,
              style: const TextStyle(fontSize: 18.0, color: Color(0xFFF4B0F9)),
            ),
            const SizedBox(height: 16.0),
            Text(
              zodiac.description,
              style: const TextStyle(fontSize: 16.0, color: Color(0xFFF4B0F9)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
