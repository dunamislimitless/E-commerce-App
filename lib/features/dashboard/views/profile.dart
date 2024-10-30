import 'package:e_commerce_app/app/utils/app_ipngs.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/features/dashboard/widget/custom_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Center(child: Text('Profile')),
            automaticallyImplyLeading: false),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                // Profile Picture
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(AppImage
                      .flower), // Replace with user's profile picture or network image
                ),
                SizedBox(height: 20),

                Text('Samuel O.', style: AppText.amountText),
                SizedBox(height: 10),

                Text(
                  'ogundojusamuel@gmail.com',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 20),

                Divider(color: Colors.grey[300], thickness: 1),

                _buildProfileDetailRow(Icons.phone, 'Phone', '+2347069332491'),
                _buildProfileDetailRow(Icons.location_on, 'Address',
                    '35, Glover Road Ikoyi Lagos'),
                _buildProfileDetailRow(Icons.cake, 'Birthday', 'January 1,'),
                _buildProfileDetailRow(
                    Icons.work, 'Occupation', 'Software Engineer'),

                SizedBox(height: 30),

                CustomButton(
                  onPressed: () {},
                  buttontext: 'Edit Profile',
                  color: AppColors.discountColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Icon(icon, color: AppColors.lightButton),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 11),
              Text(
                value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
