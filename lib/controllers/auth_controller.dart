import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/const/local_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool isLoading = false;
  LocalData localData = LocalData();

  setLoading(bool loading) {
    isLoading = loading;
    update();
  }

  Future<void> createAccount(String email, String password) async {
    try {
      setLoading(true);
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        // User created successfully
        localData.writeUID(userCredential.user!.uid);
        Get.snackbar('Success', 'Account created successfully');
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'An error occurred');
    } finally {
      setLoading(false);
    }
  }

  Future<void> loginAccount(String email, String password) async {
    try {
      setLoading(true);
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        localData.writeUID(userCredential.user!.uid);
        // User login successfully
        Get.snackbar('Success', 'Login successfully');
        Get.offAllNamed('/home');
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'An error occurred');
    } finally {
      setLoading(false);
    }
  }

  final ImagePicker _imagePicker = ImagePicker();
  File? selectedFile;

  // Function to pick an image
  Future<void> pickImage() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedFile = File(image.path);
    }
    update();
  }

  Future<String?> uploadImageToCloudinary() async {
    setLoading(true);
    String cloudName = 'dkyl04a4w';
    String uploadPreset = 'sr-ecommerce';

    var url =
        Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');

    var request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = uploadPreset
      ..files
          .add(await http.MultipartFile.fromPath('file', selectedFile!.path));

    var response = await request.send();
    var responseData = await response.stream.bytesToString();
    var jsonData = json.decode(responseData);

    if (response.statusCode == 200) {
      return jsonData['secure_url'];
    } else {
      Get.snackbar('Error', 'Failed to upload image');
      return null;
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserProfile(String name, String address, String phone) async {
    setLoading(true);
    String uid = localData.readUID();

    if (uid.isEmpty) {
      Get.snackbar('Error', 'User ID is empty');
      setLoading(false);
      return;
    }

    String? imageUrl = await uploadImageToCloudinary();

    if (imageUrl == null) {
      Get.snackbar('Error', 'Failed to upload image');
      setLoading(false);
      return;
    }

    try {
      await _firestore.collection('users').doc(uid).set({
        'name': name,
        'address': address,
        'phone': phone,
        'profile_image': imageUrl,
        'created_at': FieldValue.serverTimestamp(),
      });
      Get.snackbar('Success', 'Profile saved successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
