import 'package:flutter/material.dart';

class AddressBundel {
  final int id;
  final double balance, price;
  final String currency, title, description, imageSrc;
  final Color color;

  AddressBundel({
    this.id,
    this.currency,
    this.balance,
    this.price,
    this.title,
    this.description,
    this.imageSrc,
    this.color});
}

// Demo list
List<AddressBundel> addressBundel = [
  AddressBundel(
    id: 1,
    currency: 'Bitcoin',
    balance: 16,
    price: 95,
    title: "WalletMan 1",
    description: "This is an additional description",
    imageSrc: "assets/images/IOS.png",
    color: Colors.orange[800],
  ),
  AddressBundel(
    id: 2,
    currency: 'Ethereum',
    balance: 8,
    price: 26,
    title: "AllWallet",
    description: "This is an additional description",
    imageSrc: "assets/images/IOS.png",
    color: Colors.blue[800],
  ),
  AddressBundel(
    id: 3,
    currency: 'Litecoin',
    balance: 0.30,
    price: 0.32,
    title: "Crypto4U",
    description: "This is an additional description",
    imageSrc: "assets/images/IOS.png",
    color: Colors.green[800],
  ),
];