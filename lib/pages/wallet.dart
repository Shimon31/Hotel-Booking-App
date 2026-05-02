import 'dart:ui';

import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("My Wallet"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [

          // 🔥 Balance Card
          _buildBalanceCard(),

          const SizedBox(height: 10),

          // 🔥 Action Buttons
          _buildActions(),

          const SizedBox(height: 10),

          // 🔥 Transaction List
          Expanded(
            child: ListView(
              children: const [
                TransactionTile(
                  title: "Added Money",
                  date: "02 May 2026",
                  amount: "+৳1000",
                  isCredit: true,
                ),
                TransactionTile(
                  title: "Hotel Booking",
                  date: "01 May 2026",
                  amount: "-৳500",
                  isCredit: false,
                ),
                TransactionTile(
                  title: "Added Money",
                  date: "30 Apr 2026",
                  amount: "+৳2000",
                  isCredit: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= BALANCE CARD =================
  Widget _buildBalanceCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF6A11CB),
            Color(0xFF2575FC),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Available Balance",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
          const Text(
            "৳ 12,500",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            child: const Text("Add Money"),
          ),
        ],
      ),
    );
  }

  // ================= ACTION BUTTONS =================
  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _actionButton(Icons.add, "Add", Colors.green),
        _actionButton(Icons.send, "Send", Colors.blue),
        _actionButton(Icons.money_off, "Withdraw", Colors.purple),
        _actionButton(Icons.receipt, "Bills", Colors.orange),
      ],
    );
  }

  Widget _actionButton(IconData icon, String title, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}

// ================= TRANSACTION TILE =================

class TransactionTile extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final bool isCredit;

  const TransactionTile({
    Key? key,
    required this.title,
    required this.date,
    required this.amount,
    required this.isCredit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = isCredit ? Colors.green : Colors.red;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100, // light card
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              const SizedBox(height: 4),
              Text(date,
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),

          // Right
          Text(
            amount,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}