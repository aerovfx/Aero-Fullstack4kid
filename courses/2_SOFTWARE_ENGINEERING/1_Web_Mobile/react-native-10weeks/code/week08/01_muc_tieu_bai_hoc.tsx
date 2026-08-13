import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 08 · Bài 01: Mục tiêu bài học. */
export default function Lesson0801() {
  const progress: number = 5;
  return <View><Text>Mục tiêu bài học</Text><Text>Tiến độ: {progress}%</Text></View>;
}
