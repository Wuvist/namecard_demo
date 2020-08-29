import '../lib/src/generated/google/protobuf/empty.pb.dart';
import '../lib/NameCardService.dart';

import '../lib/src/generated/namecard.pb.dart';
import '../lib/src/generated/namecard.pbgrpc.dart';

Future<void> main(List<String> args) async {
  try {
    final response = await NameCardService().stub.getList(Empty());
    response.result.forEach((element) async {
      print(element.name);
      final item = await NameCardService().stub.getDetail(GetDetailReq()..id = element.id);
      print(item.toString());
    });
  } catch (e) {
    print('Caught error: $e');
  }
  await channel.shutdown();
}