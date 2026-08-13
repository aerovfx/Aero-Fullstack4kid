import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 01 · Bài 12: Ví dụ cơ bản tuần 01. */
export default function Lesson0112() {
  const progress: number = 60;
  return <View><Text>Ví dụ cơ bản tuần 01</Text><Text>Tiến độ: {progress}%</Text></View>;
}
