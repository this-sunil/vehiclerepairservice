part of 'ThemeBloc.dart';
class ThemeState extends Equatable{

  final ThemeData themeData;
  final bool isDark;
  const ThemeState({required this.themeData,required this.isDark});

  factory ThemeState.initial()=>ThemeState(themeData: AppRoute.lightTheme,isDark: false);


  ThemeState copyWith({
    ThemeData? themeData,
    bool? isDark,
  }) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
      isDark: isDark ?? this.isDark,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [themeData];
}