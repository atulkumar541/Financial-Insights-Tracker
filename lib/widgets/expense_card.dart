import 'package:flutter/material.dart';
import '../models/spending_model.dart';

class ExpenseCard extends StatelessWidget {
  final SpendingModel expense;
  final VoidCallback? onTap;

  const ExpenseCard({
    Key? key,
    required this.expense,
    this.onTap,
  }) : super(key: key);

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'health':
        return Icons.healing;
      case 'movie':
      case 'entertainment':
        return Icons.movie;
      case 'shopping':
        return Icons.shopping_cart;
      case 'food':
        return Icons.fastfood;
      case 'transport':
        return Icons.directions_car;
      case 'utility':
        return Icons.bolt;
      default:
        return Icons.money;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'health':
        return Colors.red;
      case 'movie':
      case 'entertainment':
        return Colors.blue;
      case 'shopping':
        return Colors.purple;
      case 'food':
        return Colors.orange;
      case 'transport':
        return Colors.teal;
      case 'utility':
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _getCategoryColor(expense.category).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getCategoryIcon(expense.category),
                  color: _getCategoryColor(expense.category),
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expense.description,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      expense.category,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Rs ${expense.amount.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                  if (expense.isImpulsive)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Impulsive',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.orange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
