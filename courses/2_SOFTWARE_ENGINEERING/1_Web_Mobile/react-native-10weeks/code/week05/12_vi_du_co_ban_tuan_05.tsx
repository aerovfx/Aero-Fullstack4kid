import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 05 · Bài 12: Ví dụ cơ bản tuần 05. */
export default function Lesson0512() {
  const progress: number = 60;
  return <View><Text>Ví dụ cơ bản tuần 05</Text><Text>Tiến độ: {progress}%</Text></View>;
}
