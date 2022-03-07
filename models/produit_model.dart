import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Produit extends Equatable {
  final int id;
  final String name;
  final String priceCategory;
  final String imageUrl;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;
  final List<String> tags;

  Produit({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.deliveryTime,
    required this.priceCategory,
    required this.deliveryFee,
    required this.distance,
    required this.tags,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        deliveryFee,
        deliveryTime,
        priceCategory,
        distance,
        tags
      ];
  static List<Produit> produits = [
    Produit(
        id: 1,
        name: ' makeup1',
        imageUrl:
            'https://images.unsplash.com/photo-1602910344008-22f323cc1817?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        deliveryFee: 2.99,
        priceCategory: '\$',
        deliveryTime: 30,
        distance: 0.1,
        tags: ['Makeup']),
    Produit(
        id: 2,
        name: 'bridal',
        imageUrl:
            'https://images.unsplash.com/photo-1482954727730-2c843ce77718?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        deliveryFee: 2.99,
        priceCategory: '\$',
        deliveryTime: 30,
        distance: 0.1,
        tags: ['Bridal']),
    Produit(
        id: 3,
        name: ' face skin',
        imageUrl:
            'https://media.istockphoto.com/photos/cropped-shot-of-pretty-young-woman-applies-cream-for-rejuvenation-picture-id1270211699?s=612x612',
        deliveryFee: 2.99,
        priceCategory: '\$',
        deliveryTime: 30,
        distance: 0.1,
        tags: ['FaceSkin']),
    Produit(
        id: 4,
        name: 'makeup',
        imageUrl:
            'https://media.istockphoto.com/photos/various-cosmetic-accessories-for-makeup-and-manicure-on-trendy-pastel-picture-id1320345717?s=612x612',
        deliveryFee: 2.99,
        priceCategory: '\$',
        deliveryTime: 30,
        distance: 0.1,
        tags: ['Makeup']),
  ];
}
