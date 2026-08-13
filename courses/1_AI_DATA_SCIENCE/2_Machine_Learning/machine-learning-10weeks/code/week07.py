"""Tuần 7: phân loại cảm xúc văn bản bằng TF-IDF."""

from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import LogisticRegression
from sklearn.pipeline import make_pipeline


TRAIN_TEXTS = [
    "phim rất hay và cảm động",
    "diễn xuất tuyệt vời",
    "nội dung nhàm chán",
    "phim quá tệ và dài dòng",
    "tôi rất thích bộ phim này",
    "một trải nghiệm thất vọng",
]
TRAIN_LABELS = [1, 1, 0, 0, 1, 0]


def main() -> None:
    model = make_pipeline(
        TfidfVectorizer(ngram_range=(1, 2)),
        LogisticRegression(random_state=42),
    )
    model.fit(TRAIN_TEXTS, TRAIN_LABELS)
    samples = ["phim hay tuyệt vời", "nội dung dài dòng và tệ"]
    for text, label, confidence in zip(samples, model.predict(samples), model.predict_proba(samples).max(axis=1)):
        print(text, "=>", "tích cực" if label else "tiêu cực", f"({confidence:.2f})")


if __name__ == "__main__":
    main()
