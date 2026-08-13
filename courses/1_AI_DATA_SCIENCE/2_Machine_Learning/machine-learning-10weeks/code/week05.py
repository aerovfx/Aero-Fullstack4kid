"""Tuần 5: mạng nơ-ron nhiều lớp cho dữ liệu dạng bảng."""

from sklearn.datasets import load_digits
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.neural_network import MLPClassifier
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import StandardScaler


def main() -> None:
    features, target = load_digits(return_X_y=True)
    x_train, x_test, y_train, y_test = train_test_split(
        features, target, test_size=0.2, random_state=42, stratify=target
    )
    model = make_pipeline(
        StandardScaler(),
        MLPClassifier(hidden_layer_sizes=(64, 32), max_iter=300, random_state=42),
    )
    model.fit(x_train, y_train)
    print("Accuracy:", accuracy_score(y_test, model.predict(x_test)))


if __name__ == "__main__":
    main()
