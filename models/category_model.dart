import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String image;
  Category({
    required this.id,
    required this.name,
    required this.image,
  });
  @override
  List<Object?> get props => [id, name, image];
  static List<Category> categories = [
    Category(
      id: 1,
      name: 'Hair',
      image: 'assets/hair.jpg',
    ),
    Category(
      id: 2,
      name: 'Makeup',
      image: 'assets/makeup.jpg',
    ),
    Category(
      id: 3,
      name: 'Bridal',
      image: 'assets/bridal.jpg',
    ),
    Category(
      id: 4,
      name: 'Massage',
      image: 'assets/massage.jpg',
    ),
    Category(
      id: 5,
      name: 'FaceSkin',
      image: 'assets/faceskin.png',
    ),
  ];
}
