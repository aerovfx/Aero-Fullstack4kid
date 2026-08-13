import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 01 · Bài 11: Cấu trúc chương trình tuần 01. */
export default function Lesson0111() {
  const progress: number = 55;
  return <View><Text>Cấu trúc chương trình tuần 01</Text><Text>Tiến độ: {progress}%</Text></View>;
}
