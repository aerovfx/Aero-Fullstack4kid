"""Tuần 1: pipeline Machine Learning hoàn chỉnh với Iris."""

from sklearn.datasets import load_iris
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC


def main() -> None:
    features, target = load_iris(return_X_y=True)
    x_train, x_test, y_train, y_test = train_test_split(
        features, target, test_size=0.2, random_state=42, stratify=target
    )
    model = make_pipeline(StandardScaler(), SVC(kernel="rbf"))
    model.fit(x_train, y_train)
    prediction = model.predict(x_test)
    print("Accuracy:", accuracy_score(y_test, prediction))


if __name__ == "__main__":
    main()
