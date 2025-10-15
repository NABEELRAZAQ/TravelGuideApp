import 'package:flutter/material.dart';

void main() {
  runApp(TravelGuideApp());
}

class TravelGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Guide',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ListScreen(),
    AboutScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Travel Guide')),
      body: SafeArea(child: _screens[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Destinations'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.teal.shade50,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Welcome to Travel Guide!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 18),
                    children: [
                      TextSpan(
                          text: 'Explore ',
                          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'the World ',
                          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'with Us!',
                          style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Enter your dream destination',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Exploring ${_controller.text}!'),
                      ),
                    );
                  },
                  child: Text('Search'),
                ),
                TextButton(
                  onPressed: () {
                    print('Explore button pressed!');
                  },
                  child: Text('Learn More'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  final List<Map<String, String>> destinations = [
    {'name': 'Paris', 'desc': 'The City of Lights and Love.'},
    {'name': 'Tokyo', 'desc': 'Modern meets tradition in Japan’s capital.'},
    {'name': 'New York', 'desc': 'The city that never sleeps.'},
    {'name': 'Sydney', 'desc': 'Home of the Opera House and beaches.'},
    {'name': 'Cairo', 'desc': 'Explore the ancient pyramids.'},
    {'name': 'Rome', 'desc': 'Walk through ancient history.'},
    {'name': 'London', 'desc': 'A blend of culture and history.'},
    {'name': 'Bali', 'desc': 'Relax in tropical paradise.'},
    {'name': 'Istanbul', 'desc': 'Where East meets West.'},
    {'name': 'Dubai', 'desc': 'Luxury and innovation in the desert.'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          child: ListTile(
            leading: Icon(Icons.location_on, color: Colors.teal),
            title: Text(destinations[index]['name']!),
            subtitle: Text(destinations[index]['desc']!),
          ),
        );
      },
    );
  }
}

class AboutScreen extends StatelessWidget {
  final List<Map<String, String>> attractions = [
    {'image': 'https://images.unsplash.com/photo-1505761671935-60b3a7427bad', 'name': 'Eiffel Tower'},
    {'image': 'https://images.unsplash.com/photo-1576402187878-974f70b73695', 'name': 'Great Wall of China'},
    {'image': 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee', 'name': 'Colosseum'},
    {'image': 'https://images.unsplash.com/photo-1518684079-3c830dcef090', 'name': 'Statue of Liberty'},
    {'image': 'https://images.unsplash.com/photo-1509475826633-fed577a2c71b', 'name': 'Taj Mahal'},
    {'image': 'https://images.unsplash.com/photo-1530521954074-e64f6810b32d', 'name': 'Sydney Opera House'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: attractions.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  attractions[index]['image']!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              attractions[index]['name']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
