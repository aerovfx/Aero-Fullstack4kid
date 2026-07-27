import numpy as np
import pandas as pd
from sklearn.ensemble import IsolationForest

def generate_synthetic_logs(num_samples=100):
    """Generates synthetic network access logs (normal traffic + anomalous spikes)."""
    np.random.seed(42)
    
    # Normal traffic: Request rate around 50-100 req/min, low byte size
    normal_reqs = np.random.normal(75, 10, int(num_samples * 0.95))
    normal_bytes = np.random.normal(500, 50, int(num_samples * 0.95))
    
    # Anomalous traffic (e.g., DoS attack or data exfiltration)
    anomaly_reqs = np.random.normal(500, 50, int(num_samples * 0.05))
    anomaly_bytes = np.random.normal(5000, 500, int(num_samples * 0.05))
    
    reqs = np.concatenate([normal_reqs, anomaly_reqs])
    bytes_sent = np.concatenate([normal_bytes, anomaly_bytes])
    
    df = pd.DataFrame({
        'requests_per_min': reqs,
        'bytes_transferred': bytes_sent
    })
    return df

def detect_anomalies():
    print("=== AI-BASED ANOMALY DETECTION MONITOR (ISOLATION FOREST) ===")
    df = generate_synthetic_logs()
    
    # Fit Isolation Forest Model
    model = IsolationForest(contamination=0.05, random_state=42)
    df['anomaly_score'] = model.fit_predict(df[['requests_per_min', 'bytes_transferred']])
    
    # Isolation forest marks anomalies with -1
    anomalies = df[df['anomaly_score'] == -1]
    
    print(f"[+] Total log records analyzed: {len(df)}")
    print(f"[⚠️ ALERT] Anomalies detected: {len(anomalies)}")
    print("\nSample Anomalous Records:")
    print(anomalies[['requests_per_min', 'bytes_transferred']])

if __name__ == "__main__":
    detect_anomalies()
