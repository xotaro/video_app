// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mongo_dart/mongo_dart.dart' as _i4;

import '../core/client.dart' as _i3;
import '../view/view_models/adding_video_vm.dart' as _i10;
import '../view/view_models/admin_control_vm.dart' as _i14;
import '../view/view_models/admin_video_control_vm.dart' as _i12;
import '../view/view_models/admin_viewstudets_vm.dart' as _i13;
import '../view/view_models/content_viewer_vm.dart' as _i11;
import '../view/view_models/load_videos_vm.dart' as _i5;
import '../view/view_models/login_vm.dart' as _i7;
import '../view/view_models/profile_vm.dart' as _i15;
import '../view/view_models/register_vm.dart' as _i8;
import '../view/view_models/student_content_viewer.dart' as _i9;
import 'mongo.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.Client>(() => _i3.Client(get<_i4.Db>()));
  gh.factory<_i5.LoadVideosViewModel>(
      () => _i5.LoadVideosViewModel(get<_i6.Database>()));
  gh.factory<_i7.LoginViewModel>(() => _i7.LoginViewModel(get<_i6.Database>()));
  gh.factory<_i8.RegisterViewModel>(
      () => _i8.RegisterViewModel(get<_i6.Database>()));
  gh.factory<_i9.StudentContentViewerViewModel>(
      () => _i9.StudentContentViewerViewModel(get<_i6.Database>()));
  gh.factory<_i10.AddVideoViewModel>(
      () => _i10.AddVideoViewModel(get<_i6.Database>()));
  gh.factory<_i11.AdminContentViewerViewModel>(
      () => _i11.AdminContentViewerViewModel(get<_i6.Database>()));
  gh.factory<_i12.AdminControlVideoViewModel>(
      () => _i12.AdminControlVideoViewModel(get<_i6.Database>()));
  gh.factory<_i13.ControlStudent>(
      () => _i13.ControlStudent(get<_i6.Database>()));
  gh.factory<_i14.ControlStudentViewModel>(
      () => _i14.ControlStudentViewModel(get<_i6.Database>()));
  gh.singleton<_i6.Database>(_i6.Database());
  gh.singleton<_i15.ProfileViewModel>(_i15.ProfileViewModel());
  return get;
}
