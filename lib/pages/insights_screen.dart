import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/index.dart';
import '../widgets/expense_card.dart';
import '../widgets/income_card.dart';
import '../models/spending_model.dart';
import '../models/income_model.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({Key? key}) : super(key: key);

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<SpendingProvider, IncomeProvider>(
      builder: (context, spendingProvider, incomeProvider, _) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Expenses',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    spendingProvider.spendings.isEmpty
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                'No expenses yet',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: spendingProvider.spendings.length,
                            itemBuilder: (context, index) {
                              return ExpenseCard(
                                expense: spendingProvider.spendings[index],
                              );
                            },
                          ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _showAddExpenseBottomSheet(context);
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add new expense'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber[100],
                          foregroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Income',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    incomeProvider.incomes.isEmpty
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                'No income recorded',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: incomeProvider.incomes.length,
                            itemBuilder: (context, index) {
                              return IncomeCard(
                                income: incomeProvider.incomes[index],
                              );
                            },
                          ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _showAddIncomeBottomSheet(context);
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add income'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.withOpacity(0.1),
                          foregroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAddExpenseBottomSheet(BuildContext context) {
    String description = '';
    double amount = 0;
    String selectedCategory = 'Needful spending';
    bool isImpulsive = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add Expense',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Reason for spending',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      description = value;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      amount = double.tryParse(value) ?? 0;
                    },
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.info, size: 16, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          'Choose category of amount spent',
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: [
                      _buildCategoryChip(
                        'Impulsive spending',
                        selectedCategory,
                        () {
                          setState(() {
                            selectedCategory = 'Impulsive spending';
                            isImpulsive = true;
                          });
                        },
                      ),
                      _buildCategoryChip(
                        'Needful spending',
                        selectedCategory,
                        () {
                          setState(() {
                            selectedCategory = 'Needful spending';
                            isImpulsive = false;
                          });
                        },
                      ),
                      _buildCategoryChip(
                        'Saving',
                        selectedCategory,
                        () {
                          setState(() {
                            selectedCategory = 'Saving';
                            isImpulsive = false;
                          });
                        },
                      ),
                      _buildCategoryChip(
                        'Health',
                        selectedCategory,
                        () {
                          setState(() {
                            selectedCategory = 'Health';
                            isImpulsive = false;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            if (description.isNotEmpty && amount > 0) {
                              final spending = SpendingModel(
                                id: DateTime.now().millisecondsSinceEpoch
                                    .toString(),
                                userId: 'user1',
                                amount: amount,
                                category: selectedCategory,
                                description: description,
                                date: DateTime.now(),
                                isImpulsive: isImpulsive,
                              );
                              context.read<SpendingProvider>().addSpending(spending);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Save'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showAddIncomeBottomSheet(BuildContext context) {
    String description = '';
    String source = '';
    double amount = 0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Income',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Income source',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) {
                  source = value;
                },
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) {
                  description = value;
                },
              ),
              const SizedBox(height: 12),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixText: 'Rs ',
                ),
                onChanged: (value) {
                  amount = double.tryParse(value) ?? 0;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        if (source.isNotEmpty && description.isNotEmpty && amount > 0) {
                          final income = IncomeModel(
                            id: DateTime.now().millisecondsSinceEpoch.toString(),
                            userId: 'user1',
                            amount: amount,
                            source: source,
                            description: description,
                            date: DateTime.now(),
                          );
                          context.read<IncomeProvider>().addIncome(income);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoryChip(
    String label,
    String selectedCategory,
    VoidCallback onTap,
  ) {
    final isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
