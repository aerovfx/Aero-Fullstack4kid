"""Tuần 10: huấn luyện, lưu và phục vụ mô hình bằng FastAPI."""

from pathlib import Path

import joblib
from fastapi import FastAPI
from pydantic import BaseModel, Field
from sklearn.datasets import load_iris
from sklearn.ensemble import RandomForestClassifier


MODEL_FILE = Path(__file__).with_name("iris_model.joblib")


def train() -> RandomForestClassifier:
    features, target = load_iris(return_X_y=True)
    model = RandomForestClassifier(n_estimators=100, random_state=42).fit(features, target)
    joblib.dump(model, MODEL_FILE)
    return model


model = joblib.load(MODEL_FILE) if MODEL_FILE.exists() else train()
app = FastAPI(title="Iris classifier")


class IrisRequest(BaseModel):
    features: list[float] = Field(min_length=4, max_length=4)


@app.post("/predict")
def predict(request: IrisRequest) -> dict[str, int]:
    return {"class_id": int(model.predict([request.features])[0])}


if __name__ == "__main__":
    print(predict(IrisRequest(features=[5.1, 3.5, 1.4, 0.2])))
