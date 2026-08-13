import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 01 · Bài 19: Kiểm thử đơn vị tuần 01. */
export default function Lesson0119() {
  const progress: number = 95;
  return <View><Text>Kiểm thử đơn vị tuần 01</Text><Text>Tiến độ: {progress}%</Text></View>;
}
