// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tagsHash() => r'e244e78d7095cdaa99cb574f33811e77d7a01dc6';

/// See also [tags].
@ProviderFor(tags)
final tagsProvider = AutoDisposeFutureProvider<List<Tag>>.internal(
  tags,
  name: r'tagsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tagsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TagsRef = AutoDisposeFutureProviderRef<List<Tag>>;
String _$walletsHash() => r'3a3689b4a49229892d9d4e5b1aa2900180ccb371';

/// See also [Wallets].
@ProviderFor(Wallets)
final walletsProvider =
    AutoDisposeAsyncNotifierProvider<Wallets, List<Wallet>>.internal(
  Wallets.new,
  name: r'walletsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$walletsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Wallets = AutoDisposeAsyncNotifier<List<Wallet>>;
String _$themeHash() => r'df28211393ee1f5bba9ec53d0f7be9e63c974566';

/// See also [theme].
@ProviderFor(theme)
final themeProvider = AutoDisposeNotifierProvider<theme, ThemeMode>.internal(
  theme.new,
  name: r'themeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$themeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$theme = AutoDisposeNotifier<ThemeMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
