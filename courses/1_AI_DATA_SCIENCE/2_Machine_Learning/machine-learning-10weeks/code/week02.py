"""Tuần 2: hồi quy tuyến tính và hồi quy logistic."""

from sklearn.datasets import load_breast_cancer, load_diabetes
from sklearn.linear_model import LinearRegression, LogisticRegression
from sklearn.metrics import accuracy_score, mean_absolute_error
from sklearn.model_selection import train_test_split
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import StandardScaler


def split(features, target):
    return train_test_split(features, target, test_size=0.2, random_state=42)


def main() -> None:
    x_train, x_test, y_train, y_test = split(*load_diabetes(return_X_y=True))
    regression = LinearRegression().fit(x_train, y_train)
    print("Linear MAE:", mean_absolute_error(y_test, regression.predict(x_test)))

    x_train, x_test, y_train, y_test = split(*load_breast_cancer(return_X_y=True))
    classifier = make_pipeline(StandardScaler(), LogisticRegression(max_iter=1_000))
    classifier.fit(x_train, y_train)
    print("Logistic accuracy:", accuracy_score(y_test, classifier.predict(x_test)))


if __name__ == "__main__":
    main()
