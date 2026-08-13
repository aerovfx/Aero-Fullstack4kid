"""Tuần 3: Decision Tree và Random Forest."""

from sklearn.datasets import load_breast_cancer
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier, export_text


def main() -> None:
    data = load_breast_cancer()
    x_train, x_test, y_train, y_test = train_test_split(
        data.data, data.target, test_size=0.2, random_state=42, stratify=data.target
    )
    tree = DecisionTreeClassifier(max_depth=3, random_state=42).fit(x_train, y_train)
    forest = RandomForestClassifier(n_estimators=200, random_state=42).fit(x_train, y_train)

    print("Tree accuracy:", accuracy_score(y_test, tree.predict(x_test)))
    print("Forest accuracy:", accuracy_score(y_test, forest.predict(x_test)))
    print(export_text(tree, feature_names=list(data.feature_names), max_depth=2))


if __name__ == "__main__":
    main()
