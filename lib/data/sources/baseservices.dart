abstract class BaseServices{
  Future get({required String url, Map<String , dynamic>? params});
  Future post({required String url,required  Map<String , dynamic> request});
  Future put({required String url, required Map<String , dynamic>  request});
  Future patch({required String url, required Map<String , dynamic>  request});
  Future delete({required String url,required Map<String , dynamic>  request});
}