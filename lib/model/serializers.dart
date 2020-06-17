// Copyright (c) 2015, Google Inc. Please see the Author file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:livro_livre_app/model/Book.dart';
import 'package:livro_livre_app/model/GoogleBookSearchResult.dart';
import 'package:livro_livre_app/model/ImageLinks.dart';
import 'package:livro_livre_app/model/VolumeInfo.dart';

import 'LivroLivreCategoriaBook.dart';
import 'YoutubeTaskDownload.dart';

part 'serializers.g.dart';

/// Example of how to use built_value serialization.
///
/// Declare a top level [Serializers] field called serializers. Annotate it
/// with [SerializersFor] and provide a `const` `List` of types you want to
/// be serializable.
///
/// The built_value code generator will provide the implementation. It will
/// contain serializers for all the types asked for explicitly plus all the
/// types needed transitively via fields.
///
/// You usually only need to do this once per project.
@SerializersFor([
  LivroLivreCategoriaBook,
  Book,
  ImageLinks,
  VolumeInfo,
  GoogleBookSearchResult,
  YoutubeTaskDownload
])
Serializers serializers = _$serializers;
Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
