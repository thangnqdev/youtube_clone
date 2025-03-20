abstract class BaseUsecase<Type, Params> {
  Future<Type> call({Params params});
}
