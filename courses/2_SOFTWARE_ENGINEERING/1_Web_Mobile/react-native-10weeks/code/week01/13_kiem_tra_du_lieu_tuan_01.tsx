import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 01 · Bài 13: Kiểm tra dữ liệu tuần 01. */
export default function Lesson0113() {
  const progress: number = 65;
  return <View><Text>Kiểm tra dữ liệu tuần 01</Text><Text>Tiến độ: {progress}%</Text></View>;
}
