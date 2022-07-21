// ignore_for_file: do_not_use_environment

import 'dart:io';

import 'package:dowing_app/core/faults/errors/inconsistent_state_error.dart';
import 'package:flutter/material.dart';

abstract class EnvMetadata {
  Env get env;

  SupportedPlatform get platform;

  bool get isDev;

  String get apiUrl;
}

class EnvMetadataImpl implements EnvMetadata {
  EnvMetadataImpl(this.env, this.apiUrl);

  @override
  final Env env;

  @override
  final String apiUrl;

  @override
  bool get isDev => env == Env.dev;

  @override
  SupportedPlatform get platform {
    if (Platform.isIOS) {
      return SupportedPlatform.ios;
    } else if (Platform.isAndroid) {
      return SupportedPlatform.android;
    }

    throw InconsistentStateError('Unsupported platform - ${Platform.operatingSystem}');
  }
}

enum Env { dev, homol, prod }

enum SupportedPlatform { android, ios }

EnvMetadata envMetadata() {
  const rawEnv = String.fromEnvironment('ENV');
  const apiUrl = String.fromEnvironment('API_ENTRY_POINT');

  final env = parseEnv(rawEnv);

  return EnvMetadataImpl(env, apiUrl);
}

@visibleForTesting
Env parseEnv(String raw) {
  switch (raw) {
    case 'DEV':
      return Env.dev;
    case 'HOMOL':
      return Env.homol;
    case 'PROD':
      return Env.prod;
    default:
      throw InconsistentStateError('Unsupported raw environment of value "$raw"');
  }
}
