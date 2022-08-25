import 'package:learland/_all.dart';

class DevelopmentServiceProvider extends ServiceProvider {
  @override
  Future<void> initAppSettings() async => appSettings = developmentAppSettings;
}

class ProductionServiceProvider extends ServiceProvider {
  @override
  Future<void> initAppSettings() async => appSettings = productionAppSettings;
}

abstract class ServiceProvider {
  late AppSettings appSettings;
  late IAuthRepository authRepository;
  late ILoadRepository loadRepository;
  late ISnapshotRepository snapshotRepository;
  late IAutomaticRepository automaticRepository;
  Future<void> initAppSettings();

  Future<void> init() async {
    await initAppSettings();
    await initFirebase();
    await initRespositories();
  }

  Future<void> initRespositories() async {
    //Those without dependencies(restApiClient dependency excluded)
    //eventsRepository = EventsRepository(restApiClient: restApiClient, storageRepository: cacheStorageRepository);
    //galleryRepository = GalleryRepository();
    authRepository = AuthRepository();
    loadRepository = LoadRepository();
    snapshotRepository = SnapshotRepository();
    automaticRepository = AutomaticRepository();
  }

  Future initFirebase() async {
    await Firebase.initializeApp();
  }
}

Future<ServiceProvider> resolveServiceProviderFromEnvironment() async {
  ServiceProvider serviceProvider;
  switch (environment) {
    case EnvironmentType.development:
      serviceProvider = DevelopmentServiceProvider();
      break;
    case EnvironmentType.production:
      serviceProvider = ProductionServiceProvider();
      break;
  }
  await serviceProvider.init();

  return serviceProvider;
}
