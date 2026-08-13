import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 01 · Bài 15: Quan sát kết quả tuần 01. */
export default function Lesson0115() {
  const progress: number = 75;
  return <View><Text>Quan sát kết quả tuần 01</Text><Text>Tiến độ: {progress}%</Text></View>;
}
