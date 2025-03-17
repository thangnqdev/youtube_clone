abstract class BasicUsecase<Type, Params> {
  Future<Type> call({Params params});
}
