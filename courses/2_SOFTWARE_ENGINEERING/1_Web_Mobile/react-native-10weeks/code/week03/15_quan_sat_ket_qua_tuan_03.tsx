import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 03 · Bài 15: Quan sát kết quả tuần 03. */
export default function Lesson0315() {
  const progress: number = 75;
  return <View><Text>Quan sát kết quả tuần 03</Text><Text>Tiến độ: {progress}%</Text></View>;
}
