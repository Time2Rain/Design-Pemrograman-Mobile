import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class ActivityDetailScreen extends StatelessWidget {
  final String category;

  const ActivityDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildActivityCard(
              title: 'Jalan Santai',
              duration: '30 menit',
              calories: '150 kal',
              icon: Icons.directions_walk,
            ),
            const SizedBox(height: 20),
            _buildActivityCard(
              title: 'Lari Pagi',
              duration: '20 menit',
              calories: '200 kal',
              icon: Icons.directions_run,
            ),
            const SizedBox(height: 20),
            _buildActivityCard(
              title: 'Bersepeda',
              duration: '45 menit',
              calories: '350 kal',
              icon: Icons.directions_bike,
            ),
            const SizedBox(height: 30),
            Text(
              'Tips $category',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildTipCard(
              title: 'Pemanasan Penting',
              content: 'Lakukan pemanasan 5-10 menit sebelum mulai olahraga',
            ),
            _buildTipCard(
              title: 'Minum Air yang Cukup',
              content: 'Minum 500ml air 2 jam sebelum berolahraga',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildActivityCard({
    required String title,
    required String duration,
    required String calories,
    required IconData icon,
  }) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 40, color: AppColors.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.timer, size: 16),
                      const SizedBox(width: 4),
                      Text(duration, style: GoogleFonts.poppins(fontSize: 14)),
                      const SizedBox(width: 16),
                      const Icon(Icons.local_fire_department, size: 16),
                      const SizedBox(width: 4),
                      Text(calories, style: GoogleFonts.poppins(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.play_circle_fill, color: AppColors.primary),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard({required String title, required String content}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(content, style: GoogleFonts.poppins()),
          ],
        ),
      ),
    );
  }
}