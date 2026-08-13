import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 03 · Bài 12: Ví dụ cơ bản tuần 03. */
export default function Lesson0312() {
  const progress: number = 60;
  return <View><Text>Ví dụ cơ bản tuần 03</Text><Text>Tiến độ: {progress}%</Text></View>;
}
