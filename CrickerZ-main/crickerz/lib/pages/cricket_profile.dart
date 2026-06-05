import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// To navigate to HomePage, assuming HomePage is there or can be extracted

class CricketProfilePage extends StatefulWidget {
  const CricketProfilePage({super.key});

  @override
  State<CricketProfilePage> createState() => _CricketProfilePageState();
}

class _CricketProfilePageState extends State<CricketProfilePage> {
  String? selectedPlayingRole;
  String? selectedBattingStyle;
  String? selectedBowlingStyle;
  ImageProvider? profileImage;
  final ImagePicker _imagePicker = ImagePicker();

  bool isLoading = false;

  final List<String> playingRoles = [
    "Opening batsman",
    "Top order batsman",
    "middle order batsman",
    "all rounder",
    "wicket keeper",
    "finisher",
    "fast bowler",
    "fast medium bowler",
    "medium pace bowler",
    "seam bowler",
    "off spinner",
    "leg spinner",
  ];

  final List<String> battingStyles = [
    "right hand batsman",
    "left hand batsman",
  ];

  final List<String> bowlingStyles = ["right hand bowler", "left hand bowler"];

  Future<void> saveProfile() async {
    if (selectedPlayingRole == null) {
      showMessage("Please select your playing role");
      return;
    }
    if (selectedBattingStyle == null) {
      showMessage("Please select your batting style");
      return;
    }

    setState(() {
      isLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    showMessage("Profile Saved Successfully");

    if (mounted) {
      Navigator.pushNamed(context, '/home');
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TITLE
              const Text(
                "Cricket Profile 🏏",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff111827),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Tell us more about your cricketing skills",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 24),
              buildPhotoUploadSection(),
              const SizedBox(height: 35),

              // PLAYING ROLE
              buildLabel("Playing Role"),
              buildDropdown(
                hint: "Select playing role",
                value: selectedPlayingRole,
                items: playingRoles,
                onChanged: (val) {
                  setState(() {
                    selectedPlayingRole = val;
                  });
                },
                icon: Icons.sports_cricket_outlined,
              ),
              const SizedBox(height: 20),

              // BATTING STYLE
              buildLabel("Batting Style"),
              buildDropdown(
                hint: "Select batting style",
                value: selectedBattingStyle,
                items: battingStyles,
                onChanged: (val) {
                  setState(() {
                    selectedBattingStyle = val;
                  });
                },
                icon: Icons.sports_score_outlined,
              ),
              const SizedBox(height: 20),

              // BOWLING STYLE
              buildLabel("Bowling Style (optional)"),
              buildDropdown(
                hint: "Select bowling style (optional)",
                value: selectedBowlingStyle,
                items: bowlingStyles,
                onChanged: (val) {
                  setState(() {
                    selectedBowlingStyle = val;
                  });
                },
                icon: Icons.sports_baseball_outlined,
              ),
              const SizedBox(height: 40),

              // SAVE BUTTON
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: isLoading ? null : saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1565C0),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          "Save Profile",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPhotoUploadSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 42,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: profileImage,
            child: profileImage == null
                ? const Icon(Icons.person, size: 46, color: Colors.grey)
                : null,
          ),
          const SizedBox(height: 14),
          const Text(
            'Upload your profile photo',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(
            'A profile photo makes it easier for other players to recognise you.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: pickPhoto,
            icon: const Icon(Icons.upload_file_outlined),
            label: const Text('Upload Photo'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff1565C0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> pickPhoto() async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 800,
      );
      if (pickedFile != null) {
        setState(() {
          profileImage = FileImage(File(pickedFile.path));
        });
      } else {
        showMessage('No photo selected');
      }
    } catch (e) {
      showMessage('Unable to pick image. Please try again.');
    }
  }

  // LABEL
  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  // DROPDOWN
  Widget buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8),
        ],
      ),
      child: DropdownButtonFormField<String>(
        initialValue: value,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          prefixIcon: Icon(icon, color: Colors.grey),
        ),
        hint: Text(hint, style: TextStyle(color: Colors.grey.shade500)),
        items: items.map((String item) {
          return DropdownMenuItem<String>(value: item, child: Text(item));
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
