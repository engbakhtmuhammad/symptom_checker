import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  String email;
  String firstName;
  String lastName;
  String bio;
  String language;
  String phoneNumber;

  bool active;

  Timestamp lastOnlineTimestamp;

  String doctorID;
  String profilePictureURL;

  bool selected;

  String appIdentifier;

  Doctor(
      {this.email = '',
      this.firstName = '',
      this.phoneNumber = '',
      this.bio = '',
      this.language = '',
      this.lastName = '',
      this.active = false,
      this.selected = false,
      lastOnlineTimestamp,
      this.doctorID = '',
      this.profilePictureURL = ''})
      : this.lastOnlineTimestamp = lastOnlineTimestamp ?? Timestamp.now(),
        this.appIdentifier = 'Flutter Login Screen ${Platform.operatingSystem}';

  String fullName() {
    return '$firstName $lastName';
  }

  factory Doctor.fromJson(Map<String, dynamic> parsedJson) {
    return new Doctor(
        email: parsedJson['email'] ?? '',
        firstName: parsedJson['firstName'] ?? '',
        lastName: parsedJson['lastName'] ?? '',
        bio: parsedJson['bio'] ?? '',
        language: parsedJson['language'] ?? '',
        active: parsedJson['active'] ?? false,
        lastOnlineTimestamp: parsedJson['lastOnlineTimestamp'],
        phoneNumber: parsedJson['phoneNumber'] ?? '',
        doctorID: parsedJson['id'] ?? parsedJson['userID'] ?? '',
        profilePictureURL: parsedJson['profilePictureURL'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'email': this.email,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'bio': this.bio,
      'language': this.language,
      'phoneNumber': this.phoneNumber,
      'id': this.doctorID,
      'active': this.active,
      'lastOnlineTimestamp': this.lastOnlineTimestamp,
      'profilePictureURL': this.profilePictureURL,
      'appIdentifier': this.appIdentifier
    };
  }
}
