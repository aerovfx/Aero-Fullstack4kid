import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 10 · Bài 12: Ví dụ cơ bản tuần 10. */
export default function Lesson1012() {
  const progress: number = 60;
  return <View><Text>Ví dụ cơ bản tuần 10</Text><Text>Tiến độ: {progress}%</Text></View>;
}
