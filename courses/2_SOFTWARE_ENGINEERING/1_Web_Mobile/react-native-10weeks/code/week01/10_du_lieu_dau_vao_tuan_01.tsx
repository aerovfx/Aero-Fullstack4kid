import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 01 · Bài 10: Dữ liệu đầu vào tuần 01. */
export default function Lesson0110() {
  const progress: number = 50;
  return <View><Text>Dữ liệu đầu vào tuần 01</Text><Text>Tiến độ: {progress}%</Text></View>;
}
