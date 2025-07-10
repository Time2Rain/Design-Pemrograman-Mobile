import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../widgets/health_card.dart';
import '../widgets/category_card.dart';
import 'activity_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> healthData = [
    {'title': 'Langkah', 'value': '10.234', 'unit': 'langkah', 'icon': Icons.directions_walk},
    {'title': 'Jarak', 'value': '7.2', 'unit': 'km', 'icon': Icons.linear_scale},
    {'title': 'Kalori', 'value': '420', 'unit': 'kal', 'icon': Icons.local_fire_department},
  ];

  final List<Map<String, dynamic>> categories = [
    {'title': 'Olahraga', 'icon': Icons.fitness_center, 'color': Colors.blue},
    {'title': 'Nutrisi', 'icon': Icons.restaurant, 'color': Colors.orange},
    {'title': 'Tidur', 'icon': Icons.bedtime, 'color': Colors.purple},
    {'title': 'Meditasi', 'icon': Icons.self_improvement, 'color': Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Teman Sehat',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hai, User!',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Bagaimana kondisi kesehatanmu hari ini?',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            
            // Health Stats Cards
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: healthData.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return HealthCard(
                    title: healthData[index]['title'],
                    value: healthData[index]['value'],
                    unit: healthData[index]['unit'],
                    icon: healthData[index]['icon'],
                  );
                },
              ),
            ),
            
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kategori',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Lihat Semua',
                    style: GoogleFonts.poppins(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            
            // Category Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryCard(
                  title: categories[index]['title'],
                  icon: categories[index]['icon'],
                  color: categories[index]['color'],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ActivityDetailScreen(
                        category: categories[index]['title'],
                      ),
                    ),
                  ),
                );
              },
            ),
            
            const SizedBox(height: 30),
            Text(
              'Aktivitas Terbaru',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildActivityItem(
              title: 'Jalan Pagi',
              time: '30 menit',
              calories: '150 kal',
              icon: Icons.directions_walk,
            ),
            _buildActivityItem(
              title: 'Bersepeda',
              time: '45 menit',
              calories: '300 kal',
              icon: Icons.directions_bike,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem({
    required String title,
    required String time,
    required String calories,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, size: 40, color: AppColors.primary),
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Durasi: $time'),
            Text('Kalori: $calories'),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}