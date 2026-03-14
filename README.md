# Financial Behaviour Coach

A personalized financial awareness and habit-building platform designed for students and young adults.

## Overview

**Financial Behaviour Coach** aims to help users understand their financial decision-making patterns and build sustainable habits early in life. While most financial apps focus on tracking expenses or investing, this platform addresses the psychological and behavioral aspects of money management.

## Key Features

### 1. **Spending Behaviour Insights**
- Identification of impulsive, emotional, or convenience-driven spending patterns
- Real-time analysis of spending habits
- Personalized alerts for unusual spending activity

### 2. **Money Personality Analysis**
- Classification of users into behavioral categories:
  - **Risk-Averse**: Conservative with money, prefers safety
  - **Impulsive**: Makes quick spending decisions
  - **Strategic**: Plans finances carefully
  - **Pragmatic**: Balanced approach to spending
  - **Visionary**: Future-focused and aspirational

### 3. **Goal-Based Financial Planning**
- Structured roadmaps to achieve goals such as:
  - Buying gadgets/electronics
  - Funding education
  - Building an emergency fund
  - Travel planning
  - Personal development
- Monthly savings calculations
- Progress tracking with visual indicators

### 4. **Gamified Challenges**
- Weekly and monthly tracker to build discipline
- Challenge types:
  - No Impulse Buy Challenge
  - Cashless Week Challenge
  - Budget Master Challenge
  - Save More Challenge
  - Track Everything Challenge
- Rewards system for completed challenges
- Progress visualization

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── constants/
│   └── app_constants.dart   # App-wide constants
├── theme/
│   └── app_theme.dart       # Theme configuration and styles
├── models/
│   ├── user_model.dart
│   ├── spending_model.dart
│   ├── goal_model.dart
│   ├── challenge_model.dart
│   └── index.dart
├── providers/              # State management
│   ├── user_provider.dart
│   ├── spending_provider.dart
│   ├── goal_provider.dart
│   ├── challenge_provider.dart
│   └── index.dart
├── pages/                  # Screen pages
│   ├── home/
│   ├── dashboard/
│   ├── profile/
│   ├── goals/
│   └── challenges/
├── widgets/               # Reusable UI components
├── services/             # Business logic and APIs
├── utils/               # Helper utilities
│   ├── helper_utils.dart
│   ├── analysis_utils.dart
│   └── index.dart
```

## Data Models

### UserModel
- User profile information
- Money personality classification
- Monthly income tracking
- Account creation timestamp

### SpendingModel
- Amount and category
- Date and payment method
- Impulsive spending flag
- Description

### GoalModel
- Goal title and target amount
- Current progress
- Target date and priority
- Category classification

### ChallengeModel
- Challenge type and duration
- Progress tracking
- Reward points
- Status (active/completed)

## Dependencies

- **provider**: State management
- **shared_preferences**: Local storage
- **sqflite**: Local database
- **path_provider**: File system access
- **fl_chart**: Data visualization
- **intl**: Date and number formatting
- **google_fonts**: Typography
- **uuid**: Unique ID generation
- **connectivity_plus**: Network status

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Generate files (if needed):
   ```bash
   flutter pub run build_runner build
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Feature Development Roadmap

- [ ] User authentication (signup/login)
- [ ] Spending entry and tracking
- [ ] Dashboard with analytics
- [ ] Goal creation and progress tracking
- [ ] Challenge management
- [ ] Personality assessment
- [ ] Behavioral insights generation
- [ ] Push notifications
- [ ] Export reports
- [ ] Multi-language support

## State Management

The app uses **Provider** pattern for state management. Key providers:

- **UserProvider**: User authentication and profile
- **SpendingProvider**: Spending tracking and analysis
- **GoalProvider**: Goal management
- **ChallengeProvider**: Challenge tracking

## Color Scheme

- **Primary**: Indigo (#6366F1)
- **Secondary**: Teal (#10B981)
- **Accent**: Amber (#F59E0B)
- **Success**: Green (#10B981)
- **Warning**: Amber (#F59E0B)
- **Error**: Red (#EF4444)

## Contributing

1. Follow the existing code structure
2. Use meaningful variable and function names
3. Add comments for complex logic
4. Ensure consistent formatting

## License

This project is private and confidential.

## Support

For questions or issues, please reach out to the development team.
