import 'package:grpc/grpc.dart';

import '../lib/src/generated/namecard.pb.dart';
import '../lib/src/generated/namecard.pbgrpc.dart';

List<GetDetailResp> testData = [
  GetDetailResp()
    ..id = 1
    ..name = "Tom"
    ..title = "Engineer"
    ..address = "Singapore"
    ..tel = "+65 84052316",
  GetDetailResp()
    ..id = 2
    ..name = "Chen JW"
    ..title = "Engineer"
    ..address = "China"
    ..tel = "+86 1234564789",
];

class NameCardService extends NameCardServiceBase {
  @override
  Future<GetDetailResp> getDetail(ServiceCall call, GetDetailReq request) async {
    testData.forEach((element) {
      if (element.id == request.id) {
        return element;
      }
    });

    return null;
  }

  @override
  Future<GetListResp> getList(ServiceCall call, request) async {
    var result = GetListResp();
    testData.forEach((element) {
      result.result.add(NameCardListItem()
        ..id = element.id
      ..name = element.name);
    });

    return result;
  }
}

Future<void> main(List<String> args) async {
  final server = Server([NameCardService()]);
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}
