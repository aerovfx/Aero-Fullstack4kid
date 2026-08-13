import React from "react";
import { Text, View } from "react-native";

/** react-native-10weeks · Tuần 02 · Bài 12: Ví dụ cơ bản tuần 02. */
export default function Lesson0212() {
  const progress: number = 60;
  return <View><Text>Ví dụ cơ bản tuần 02</Text><Text>Tiến độ: {progress}%</Text></View>;
}
