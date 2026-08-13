"""Tuần 4: phân cụm K-Means và giảm chiều PCA."""

from sklearn.cluster import KMeans
from sklearn.datasets import load_iris
from sklearn.decomposition import PCA
from sklearn.metrics import silhouette_score
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import StandardScaler


def main() -> None:
    features = load_iris().data
    scaled = StandardScaler().fit_transform(features)
    labels = KMeans(n_clusters=3, n_init=10, random_state=42).fit_predict(scaled)
    projection = make_pipeline(StandardScaler(), PCA(n_components=2)).fit_transform(features)

    print("Silhouette score:", silhouette_score(scaled, labels))
    print("PCA shape:", projection.shape)
    print("Năm điểm đầu:\n", projection[:5])


if __name__ == "__main__":
    main()
