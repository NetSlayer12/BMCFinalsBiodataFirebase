import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController birthplaceController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController civilController = TextEditingController();
  final TextEditingController nationalController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController motherController = TextEditingController();
  final TextEditingController fatherController = TextEditingController();
  




  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveData() async {
    if (nameController.text.trim().isEmpty ||
        ageController.text.trim().isEmpty ||
        birthdateController.text.trim().isEmpty || 
        birthplaceController.text.trim().isEmpty ||
        genderController.text.trim().isEmpty ||
        civilController.text.trim().isEmpty ||
        nationalController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty ||
        contactController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        motherController.text.trim().isEmpty ||
        fatherController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    await firestore.collection('students').add({
      'name': nameController.text.trim(),
      'age': ageController.text.trim(),
      'birthdate': birthdateController.text.trim(),
      'birthplace': birthplaceController.text.trim(),
      'gender': genderController.text.trim(),
      'civil status': civilController.text.trim(),
      'nationality': nationalController.text.trim(),
      'address': addressController.text.trim(),
      'contact': contactController.text.trim(),
      'email': emailController.text.trim(),
      'mother': motherController.text.trim(),
      'father': fatherController.text.trim(),
      

      'createdAt': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data saved successfully')),
    );

    nameController.clear();
    ageController.clear();
    birthdateController.clear();
    birthplaceController.clear();
    genderController.clear();
    civilController.clear();
    nationalController.clear();
    addressController.clear();
    contactController.clear();
    emailController.clear();
    motherController.clear();
    fatherController.clear();
    


  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    birthdateController.dispose();
    birthplaceController.dispose();
    genderController.dispose();
    civilController.dispose();
    nationalController.dispose();
    addressController.dispose();
    contactController.dispose();
    emailController.dispose();
    motherController.dispose();
    fatherController.dispose();



    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bio Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: birthdateController,
              decoration: const InputDecoration(
                labelText: 'Birth Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: birthplaceController,
              decoration: const InputDecoration(
                labelText: 'Birth Place',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: genderController,
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: civilController,
              decoration: const InputDecoration(
                labelText: 'Civil Status',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

             TextField(
              controller: nationalController,
              decoration: const InputDecoration(
                labelText: 'Nationality',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

             TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

             TextField(
              controller: contactController,
              decoration: const InputDecoration(
                labelText: 'Contact',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

             TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

             TextField(
              controller: motherController,
              decoration: const InputDecoration(
                labelText: 'Mother',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

             TextField(
              controller: fatherController,
              decoration: const InputDecoration(
                labelText: 'Father',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveData,
              child: const Text('Save to Firebase'),
            ),
          ],
        ),
      ),
    );
  }
}
