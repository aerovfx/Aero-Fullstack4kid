import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 10 · Bài 15: Quan sát kết quả tuần 10. */
export default function Lesson1015() {
  const progress: number = 75;
  return <View><Text>Quan sát kết quả tuần 10</Text><Text>Tiến độ: {progress}%</Text></View>;
}
