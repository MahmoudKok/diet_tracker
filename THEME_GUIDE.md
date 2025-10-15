# Theme System Guide

## Overview
This guide explains how to use the refreshed semantic color system and typography optimized for diet tracking applications.

## Color Token Usage Guidelines

### Text Scale Usage

#### On Light Surfaces
- **`textDark`** (`#1C1B1F`): Primary body text, headings, important numbers
- **`textDarker`** (`#49454F`): Secondary text, labels, descriptions
- **`textDarkest`** (`#79747E`): De-emphasized text, timestamps, metadata

#### On Dark Surfaces  
- **`textLight`** (`#E6E1E5`): Primary body text, headings, important numbers
- **`textLighter`** (`#CAC4D0`): Secondary text, labels, descriptions
- **`textLightest`** (`#938F99`): De-emphasized text, timestamps, metadata

#### Universal
- **`textMuted`** (`#B5B5B5` light / `#616161` dark): Disabled states, placeholders

### Status Colors

#### Success (Green Family)
```dart
// Use for: Completed goals, positive progress, confirmations
ColorProvider.of(context).success        // Main success color
ColorProvider.of(context).onSuccess       // Text on success background
ColorProvider.of(context).successContainer // Light success background
ColorProvider.of(context).onSuccessContainer // Text on success container
```

#### Warning (Orange Family)
```dart
// Use for: Approaching limits, caution states, pending actions
ColorProvider.of(context).warning        // Main warning color
ColorProvider.of(context).onWarning       // Text on warning background
ColorProvider.of(context).warningContainer // Light warning background
ColorProvider.of(context).onWarningContainer // Text on warning container
```

#### Error (Red Family)
```dart
// Use for: Validation errors, failed actions, critical alerts
ColorProvider.of(context).error          // Main error color
ColorProvider.of(context).onError         // Text on error background
ColorProvider.of(context).errorContainer  // Light error background
ColorProvider.of(context).onErrorContainer // Text on error container
```

#### Info (Blue Family)
```dart
// Use for: Information messages, tips, neutral notifications
ColorProvider.of(context).info           // Main info color
ColorProvider.of(context).onInfo          // Text on info background
ColorProvider.of(context).infoContainer  // Light info background
ColorProvider.of(context).onInfoContainer // Text on info container
```

### Surface Colors

#### Background & Surface
```dart
ColorProvider.of(context).background     // Main app background
ColorProvider.of(context).onBackground   // Text on background
ColorProvider.of(context).surface        // Card/sheet backgrounds
ColorProvider.of(context).onSurface       // Text on surface
ColorProvider.of(context).surfaceVariant // Elevated surfaces
ColorProvider.of(context).onSurfaceVariant // Text on surface variant
```

#### Outlines & Dividers
```dart
ColorProvider.of(context).outline        // Primary borders
ColorProvider.of(context).outlineVariant // Subtle borders, dividers
```

### Chart/Data Visualization Colors

```dart
// Use for fl_chart and other data visualizations
ColorProvider.of(context).chartPrimary   // Main data series (calories consumed)
ColorProvider.of(context).chartSecondary // Comparison series (goal line)
ColorProvider.of(context).chartTertiary  // Additional data series
ColorProvider.of(context).chartPositive // Positive values (surplus, gain)
ColorProvider.of(context).chartNegative // Negative values (deficit, loss)
ColorProvider.of(context).chartGrid     // Grid lines, axes
ColorProvider.of(context).chartLabel     // Axis labels, legends
```

## Typography Usage

### Text Styles for Diet Tracking

#### Large Metrics (Calories, Weight Totals)
```dart
TextStyle(
  style: Theme.of(context).textTheme.displayLarge, // 32sp, bold
  // Use for: Daily calorie totals, current weight, weekly goals
)
```

#### Section Headers
```dart
TextStyle(
  style: Theme.of(context).textTheme.headlineLarge, // 24sp, semiBold
  // Use for: "Daily Summary", "Weekly Plan", "Meal Log"
)
```

#### Meal Entry Numbers
```dart
TextStyle(
  style: Theme.of(context).textTheme.headlineMedium, // 20sp, medium
  // Use for: Individual meal calories, portion sizes
)
```

#### Card Titles & Labels
```dart
TextStyle(
  style: Theme.of(context).textTheme.titleLarge, // 16sp, medium
  // Use for: Food item names, category headers
)
```

#### Body Text
```dart
TextStyle(
  style: Theme.of(context).textTheme.bodyLarge, // 16sp, regular
  // Use for: Descriptions, instructions, general content
)
```

#### Secondary Information
```dart
TextStyle(
  style: Theme.of(context).textTheme.bodyMedium, // 14sp, regular
  // Use for: Secondary details, additional info
)
```

#### Timestamps & Metadata
```dart
TextStyle(
  style: Theme.of(context).textTheme.bodySmall, // 12sp, regular
  // Use for: "2 hours ago", "Last updated", timestamps
)
```

#### Button Labels
```dart
TextStyle(
  style: Theme.of(context).textTheme.labelLarge, // 14sp, medium
  // Use for: Button text, chip labels, action items
)
```

## Component Examples

### Button Usage
```dart
// Primary Button
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: ColorProvider.of(context).primary,
    foregroundColor: ColorProvider.of(context).onPrimary,
  ),
  child: Text('Add Meal', style: Theme.of(context).textTheme.labelLarge),
)

// Success Button
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: ColorProvider.of(context).success,
    foregroundColor: ColorProvider.of(context).onSuccess,
  ),
  child: Text('Complete Goal', style: Theme.of(context).textTheme.labelLarge),
)
```

### Card Usage
```dart
Card(
  color: ColorProvider.of(context).surface,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Daily Calories',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          '2,150 / 2,000',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          '150 calories over goal',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: ColorProvider.of(context).warning,
          ),
        ),
      ],
    ),
  ),
)
```

### Input Field Usage
```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Calories',
    hintText: 'Enter calories',
    fillColor: ColorProvider.of(context).surfaceVariant,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: ColorProvider.of(context).outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorProvider.of(context).primary),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorProvider.of(context).error),
    ),
  ),
)
```

### Status Message Usage
```dart
// Success Message
Container(
  padding: EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: ColorProvider.of(context).successContainer,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Text(
    'Goal completed!',
    style: TextStyle(
      color: ColorProvider.of(context).onSuccessContainer,
    ),
  ),
)

// Error Message
Container(
  padding: EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: ColorProvider.of(context).errorContainer,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Text(
    'Please enter a valid number',
    style: TextStyle(
      color: ColorProvider.of(context).onErrorContainer,
    ),
  ),
)
```

## Accessibility Checklist

### Contrast Requirements
- **Body text**: ≥4.5:1 contrast ratio
- **Large text** (≥18pt/14pt bold): ≥3:1 contrast ratio
- **Icons and UI elements**: ≥3:1 contrast ratio
- **Focus indicators**: ≥3:1 contrast ratio

### Touch Targets
- **Minimum size**: 44pt × 44pt
- **Spacing**: ≥8pt between touch targets
- **Visual feedback**: Clear pressed/focused states

### Focus Management
- **Keyboard navigation**: All interactive elements focusable
- **Focus indicators**: Visible focus rings with ≥3:1 contrast
- **Logical tab order**: Intuitive navigation sequence

### Screen Reader Support
- **Semantic labels**: Proper accessibility labels
- **Content descriptions**: Meaningful descriptions for images/icons
- **State announcements**: Clear state changes

## Best Practices

### Color Usage
1. **Always use semantic tokens** - Never hardcode color values
2. **Test both themes** - Verify appearance in light and dark modes
3. **Consider context** - Use appropriate text scale for surface type
4. **Maintain hierarchy** - Use consistent color relationships

### Typography
1. **Use text styles** - Leverage theme text styles for consistency
2. **Optimize for numbers** - Use displayLarge for important metrics
3. **Maintain readability** - Ensure sufficient contrast and spacing
4. **Consider density** - Adjust spacing for different screen sizes

### Component Design
1. **Follow Material 3** - Use proper surface and elevation tokens
2. **Consistent spacing** - Use theme-based padding and margins
3. **Clear states** - Distinguish enabled/disabled/focused/pressed states
4. **Meaningful feedback** - Use appropriate status colors for user actions

## Migration Notes

### From Old System
- Replace `ColorProvider.of(context).darkest` with `ColorProvider.of(context).textDark`
- Replace `ColorProvider.of(context).darker` with `ColorProvider.of(context).textDarker`
- Replace `ColorProvider.of(context).dark` with `ColorProvider.of(context).textDarkest`
- Use new status colors instead of hardcoded `Colors.green`, `Colors.red`, etc.

### Font Changes
- Replace `AppFonts.cairo` with `AppFonts.primary` (Poppins)
- Use `FontWeightManager.black` for large metrics display
- Leverage improved letter spacing for numeric readability
