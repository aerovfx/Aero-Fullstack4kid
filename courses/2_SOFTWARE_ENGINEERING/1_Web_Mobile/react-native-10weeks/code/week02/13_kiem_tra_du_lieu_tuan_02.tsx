import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 02 · Bài 13: Kiểm tra dữ liệu tuần 02. */
export default function Lesson0213() {
  const progress: number = 65;
  return <View><Text>Kiểm tra dữ liệu tuần 02</Text><Text>Tiến độ: {progress}%</Text></View>;
}
