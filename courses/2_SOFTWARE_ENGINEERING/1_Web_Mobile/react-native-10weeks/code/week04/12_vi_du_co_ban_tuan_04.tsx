import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 04 · Bài 12: Ví dụ cơ bản tuần 04. */
export default function Lesson0412() {
  const progress: number = 60;
  return <View><Text>Ví dụ cơ bản tuần 04</Text><Text>Tiến độ: {progress}%</Text></View>;
}
