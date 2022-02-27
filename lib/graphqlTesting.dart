import 'package:graphql/client.dart';
import 'package:pujapurohit/main.dart';
import 'package:pujapurohit/utils/epub_reader.dart';

void test() async {
  var httpLink;
  var glclient = GraphQLClient(
    /// pass the store to the cache for persistence
    cache: GraphQLCache(store: await getClient(httpLink)),
    link: httpLink,
  );
  final bookQuery = booksQuery("Vishnu-Purana", "English");

  final QueryOptions options = QueryOptions(
      //document: gql(countriesQuery),
      document: gql(bookQuery));

  final QueryResult result = await glclient.query(options);

  print(result);
}
