import pandas as pd

# Load the Excel file and read the sheet named "THONG KE"
file_path = "/mnt/data/thongke.xlsx"
df = pd.read_excel(file_path, sheet_name="THONG KE")

# Display the first few rows to understand the structure
df.head()

# THONG KE TRANG THAI
import numpy as np

# Thêm cột "Trạng thái" để xác định Đậu hoặc Nguy cơ (TB >= 5.0 là Đậu)
df["Trạng thái"] = np.where(df["TB"] >= 5.0, "Đậu", "Nguy cơ")

# Thống kê tổng số học sinh, số học sinh Đậu và Nguy cơ
total_students = len(df)
passed_students = (df["Trạng thái"] == "Đậu").sum()
at_risk_students = (df["Trạng thái"] == "Nguy cơ").sum()

# Tính tỷ lệ phần trăm
passed_ratio = passed_students / total_students * 100
at_risk_ratio = at_risk_students / total_students * 100

# Tính điểm trung bình theo từng môn (bỏ qua các giá trị NaN)
subject_columns = ["Ngữ văn", "Toán", "Lý", "Hoá", "Sinh-CN", "Sử", "Địa", "KTPL"]
average_scores = df[subject_columns].mean()

{
    "Tổng số học sinh": total_students,
    "Số học sinh Đậu": passed_students,
    "Tỷ lệ Đậu (%)": round(passed_ratio, 2),
    "Số học sinh Nguy cơ": at_risk_students,
    "Tỷ lệ Nguy cơ (%)": round(at_risk_ratio, 2),
    "Điểm trung bình các môn": average_scores.round(2).to_dict()
}

# THONG KE
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report
from sklearn.impute import SimpleImputer

# Chọn đặc trưng đầu vào (các môn học) và nhãn đầu ra ("Trạng thái")
features = df[subject_columns]
labels = df["Trạng thái"]

# Xử lý giá trị thiếu bằng cách thay thế bằng trung bình cột
imputer = SimpleImputer(strategy="mean")
features_imputed = imputer.fit_transform(features)

# Chuyển nhãn thành số: Đậu = 1, Nguy cơ = 0
labels_binary = (labels == "Đậu").astype(int)

# Tách dữ liệu thành train/test
X_train, X_test, y_train, y_test = train_test_split(features_imputed, labels_binary, test_size=0.2, random_state=42)

# Huấn luyện mô hình Random Forest
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

# Dự đoán và đánh giá
y_pred = model.predict(X_test)
report = classification_report(y_test, y_pred, output_dict=True)

# Lưu mô hình để dùng dự báo sau
trained_model = model
trained_imputer = imputer

# Hiển thị báo cáo phân loại
report
# Dự báo xác suất đậu cho toàn bộ học sinh
features_full = trained_imputer.transform(df[subject_columns])
probabilities = trained_model.predict_proba(features_full)[:, 1]  # Xác suất thuộc lớp 'Đậu'

# Gán vào DataFrame
df["Xác suất đậu"] = probabilities
df["Khuyến nghị"] = np.where(df["Xác suất đậu"] >= 0.5, "Tiếp tục phát huy", "Cần hỗ trợ gấp")

# Chọn các cột cần thiết để xuất
output_df = df[["STT", "Lớp", "Họ và tên thí sinh", "TB", "Trạng thái", "Xác suất đậu", "Khuyến nghị"]]

# Lưu ra file Excel
output_path = "/mnt/data/du_bao_ket_qua.xlsx"
output_df.to_excel(output_path, index=False)

output_path
# Reload necessary libraries and re-import data due to code environment reset
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report
from sklearn.impute import SimpleImputer

# Load the Excel file again
file_path = "/mnt/data/thongke.xlsx"
df = pd.read_excel(file_path, sheet_name="THONG KE")

# Recreate the 'Trạng thái' column
df["Trạng thái"] = np.where(df["TB"] >= 5.0, "Đậu", "Nguy cơ")

# Define feature columns and prepare data
subject_columns = ["Ngữ văn", "Toán", "Lý", "Hoá", "Sinh-CN", "Sử", "Địa", "KTPL"]
features = df[subject_columns]
labels = (df["Trạng thái"] == "Đậu").astype(int)

# Handle missing values
imputer = SimpleImputer(strategy="mean")
features_imputed = imputer.fit_transform(features)

# Train-test split
X_train, X_test, y_train, y_test = train_test_split(features_imputed, labels, test_size=0.2, random_state=42)

# Train Random Forest model
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

# Predict probabilities for all students
features_full = imputer.transform(features)
probabilities = model.predict_proba(features_full)[:, 1]

# Add predictions to the DataFrame
df["Xác suất đậu"] = probabilities
df["Khuyến nghị"] = np.where(df["Xác suất đậu"] >= 0.5, "Tiếp tục phát huy", "Cần hỗ trợ gấp")

# Export relevant columns to Excel
output_df = df[["STT", "Lớp", "Họ và tên thí sinh", "TB", "Trạng thái", "Xác suất đậu", "Khuyến nghị"]]
output_path = "/mnt/data/du_bao_ket_qua.xlsx"
output_df.to_excel(output_path, index=False)

output_path

