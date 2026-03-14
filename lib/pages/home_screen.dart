import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/index.dart';
import '../widgets/expense_card.dart';
import '../widgets/income_card.dart';
import '../widgets/pie_chart_widget.dart';
import '../models/spending_model.dart';
import '../models/income_model.dart';
import 'insights_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize with sample data
    _initializeSampleData();
  }

  void _initializeSampleData() {
    final spendingProvider = context.read<SpendingProvider>();
    final incomeProvider = context.read<IncomeProvider>();

    // Add sample spending data
    spendingProvider.addSpending(
      SpendingModel(
        id: '1',
        userId: 'user1',
        amount: 1000,
        category: 'Entertainment',
        description: 'Watching movie',
        date: DateTime.now(),
        isImpulsive: true,
      ),
    );

    spendingProvider.addSpending(
      SpendingModel(
        id: '2',
        userId: 'user1',
        amount: 1000,
        category: 'Health',
        description: 'Buying medicine',
        date: DateTime.now(),
        isImpulsive: false,
      ),
    );

    spendingProvider.addSpending(
      SpendingModel(
        id: '3',
        userId: 'user1',
        amount: 1000,
        category: 'Health',
        description: 'Doctor checkup',
        date: DateTime.now(),
        isImpulsive: false,
      ),
    );

    // Add sample income data
    incomeProvider.addIncome(
      IncomeModel(
        id: '1',
        userId: 'user1',
        amount: 10000,
        source: 'Salary',
        description: 'Salary received',
        date: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text(_selectedIndex == 0 ? 'Financial Tracker' : 'Insights'),
      //   // elevation: 0,
      //   // backgroundColor: Colors.white,
      //   // foregroundColor: Colors.black87,
      // ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeContent(),
          const InsightsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights),
            label: 'Insights',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return Consumer2<SpendingProvider, IncomeProvider>(
      builder: (context, spendingProvider, incomeProvider, _) {
        final totalIncome = incomeProvider.totalIncome;
        final totalSpending = spendingProvider.totalSpending;
        final impulsiveSpending = spendingProvider.totalImpulsiveSpending;

        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    PieChartWidget(
                      inflow: totalIncome,
                      outflow: totalSpending,
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Impulsive',
                                style: TextStyle(fontSize: 12, color: Colors.orange),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Rs ${impulsiveSpending.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Health',
                                style: TextStyle(fontSize: 12, color: Colors.red[400]),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Rs ${spendingProvider.spendingByCategory['Health']?.toStringAsFixed(0) ?? '0'}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: spendingProvider.spendings.length +
                    incomeProvider.incomes.length,
                itemBuilder: (context, index) {
                  if (index < spendingProvider.spendings.length) {
                    return ExpenseCard(
                      expense: spendingProvider.spendings[index],
                    );
                  } else {
                    final incomeIndex =
                        index - spendingProvider.spendings.length;
                    return IncomeCard(
                      income: incomeProvider.incomes[incomeIndex],
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
