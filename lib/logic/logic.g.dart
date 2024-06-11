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
String _$aiHash() => r'694fb6112ee86d3780194e67dae89ceb49d61c8b';

/// See also [ai].
@ProviderFor(ai)
final aiProvider = AutoDisposeFutureProvider<String?>.internal(
  ai,
  name: r'aiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AiRef = AutoDisposeFutureProviderRef<String?>;
String _$walletsHash() => r'94039dc05b745d48d1bcd9aa744c52c5847f297b';

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
String _$nodesHash() => r'badc31ceff06d80b32804514fd03fb2a5e70508a';

/// See also [Nodes].
@ProviderFor(Nodes)
final nodesProvider =
    AutoDisposeAsyncNotifierProvider<Nodes, List<Node>>.internal(
  Nodes.new,
  name: r'nodesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Nodes = AutoDisposeAsyncNotifier<List<Node>>;
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
String _$balanceHash() => r'64c311c79b80bfb201e389b078cbf08b4d731eda';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Balance
    extends BuildlessAutoDisposeAsyncNotifier<Map<String, double>> {
  late final int sad;

  FutureOr<Map<String, double>> build(
    int sad,
  );
}

/// See also [Balance].
@ProviderFor(Balance)
const balanceProvider = BalanceFamily();

/// See also [Balance].
class BalanceFamily extends Family<AsyncValue<Map<String, double>>> {
  /// See also [Balance].
  const BalanceFamily();

  /// See also [Balance].
  BalanceProvider call(
    int sad,
  ) {
    return BalanceProvider(
      sad,
    );
  }

  @override
  BalanceProvider getProviderOverride(
    covariant BalanceProvider provider,
  ) {
    return call(
      provider.sad,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'balanceProvider';
}

/// See also [Balance].
class BalanceProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Balance, Map<String, double>> {
  /// See also [Balance].
  BalanceProvider(
    int sad,
  ) : this._internal(
          () => Balance()..sad = sad,
          from: balanceProvider,
          name: r'balanceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$balanceHash,
          dependencies: BalanceFamily._dependencies,
          allTransitiveDependencies: BalanceFamily._allTransitiveDependencies,
          sad: sad,
        );

  BalanceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sad,
  }) : super.internal();

  final int sad;

  @override
  FutureOr<Map<String, double>> runNotifierBuild(
    covariant Balance notifier,
  ) {
    return notifier.build(
      sad,
    );
  }

  @override
  Override overrideWith(Balance Function() create) {
    return ProviderOverride(
      origin: this,
      override: BalanceProvider._internal(
        () => create()..sad = sad,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sad: sad,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Balance, Map<String, double>>
      createElement() {
    return _BalanceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BalanceProvider && other.sad == sad;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sad.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BalanceRef on AutoDisposeAsyncNotifierProviderRef<Map<String, double>> {
  /// The parameter `sad` of this provider.
  int get sad;
}

class _BalanceProviderElement extends AutoDisposeAsyncNotifierProviderElement<
    Balance, Map<String, double>> with BalanceRef {
  _BalanceProviderElement(super.provider);

  @override
  int get sad => (origin as BalanceProvider).sad;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
