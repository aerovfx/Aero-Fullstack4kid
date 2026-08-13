import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 02 · Bài 15: Quan sát kết quả tuần 02. */
export default function Lesson0215() {
  const progress: number = 75;
  return <View><Text>Quan sát kết quả tuần 02</Text><Text>Tiến độ: {progress}%</Text></View>;
}
