# Giáo trình Cơ sở Học sâu (Deep Learning)

**Thời gian: 8 tuần**

## 1. Mục tiêu khóa học
- Dành cho học viên đã có nền tảng về Machine Learning.
- Học về các mô hình Deep Learning: CNN, RNN, LSTM-GRU, Cơ chế Attention.
- Xây dựng các mô hình cơ bản cho bài toán thị giác máy tính (Computer Vision) và xử lý ngôn ngữ tự nhiên (NLP).

## 2. Giáo trình chi tiết

### **Tuần 1: Giới thiệu khóa học & Mạng nơ-ron truyền thẳng (MLP - Multilayer Perceptron) (1)**
- Giới thiệu tổng quan về khóa học.
- Hồi quy tuyến tính, hồi quy logistic, hồi quy softmax.
- Mạng nơ-ron đa tầng (Multilayer Perceptron - MLP).
- Thuật toán lan truyền xuôi (Feedforward Algorithm).
- Hàm mất mát: MSE, Cross-Entropy (trực giác & nguyên lý cực đại hợp lý).
- Thuật toán tối ưu hóa: Stochastic Gradient Descent.
- Thuật toán lan truyền ngược (Backpropagation).
- **Thực hành**: Xây dựng MLP từ đầu với MNIST - Phần 1.

### **Tuần 2: MLP (2) & Giới thiệu PyTorch**
- Các kỹ thuật chính quy hóa (Regularization): Weight decay, Dropout, Data Augmentation.
- Các thuật toán tối ưu nâng cao: Momentum, RMSProp, Adam.
- Các hàm kích hoạt: Sigmoid, Tanh, ReLU.
- Khởi tạo trọng số và điều chỉnh siêu tham số (Hyperparameter tuning).
- **Thực hành**: Xây dựng MLP từ đầu với MNIST - Phần 2.
- **Thực hành**: Giới thiệu PyTorch và cách sử dụng cơ bản.
- **Bài tập 1**: Phân loại ảnh CIFAR10 bằng MLP.

### **Tuần 3: Mạng nơ-ron tích chập (CNN - Convolutional Neural Network) (1)**
- Trích xuất đặc trưng ảnh: Phép tích chập và phát hiện biên.
- Lớp tích chập (Convolution Layer).
- Các tham số quan trọng: Padding, Stride.
- Lớp Pooling.
- Lớp Fully Connected và Flatten.
- **Thực hành**: Xây dựng CNN với PyTorch.

### **Tuần 4: CNN (2) & Học chuyển giao (Transfer Learning)**
- Các kiến trúc CNN phổ biến: VGGNet, InceptionNet, ResNet, MobileNet, EfficientNet.
- Hiểu CNN thông qua trực quan hóa đặc trưng (Feature Visualization).
- Batch Normalization, Group Normalization.
- Học chuyển giao (Transfer Learning).
- **Thực hành**: Học chuyển giao với PyTorch.
- **Bài tập 2**: Phân loại ảnh CIFAR10 bằng CNN.

### **Tuần 5: Biểu diễn từ & Mạng nơ-ron hồi tiếp (RNN - Recurrent Neural Network) (1)**
- Mô hình ngôn ngữ (Language Model).
- Biểu diễn từ (Word Representation): Word2Vec (CBOW & Skip-gram).
- **Thực hành**: Xây dựng mô hình Word2Vec.
- Mạng RNN cơ bản (Vanilla RNN).
- Các vấn đề của RNN:
  - Vanishing/Exploding Gradient.
  - Phụ thuộc dài hạn (Long-term dependency).
- **Thực hành**: Phân loại văn bản với RNN + Word2Vec.

### **Tuần 6: RNN (2) & Mô hình Dịch máy (Seq2Seq)**
- RNN hai chiều (Bidirectional RNN).
- RNN sâu (Deep/Stacked RNN).
- Bộ nhớ dài ngắn hạn (LSTM - Long Short-Term Memory).
- Đơn vị hồi tiếp có cổng (GRU - Gated Recurrent Unit).
- **Thực hành**: Phân loại văn bản với LSTM + Word2Vec.

- **Mô hình Seq2Seq trong dịch máy:**
  - Giới thiệu bài toán dịch máy.
  - Mô hình Sequence-to-Sequence.
  - Beam Search.
  - **Thực hành**: Dịch Anh-Việt với RNN thuần túy.

- **Bài tập 3**: Dịch Anh-Việt với LSTM + Attention.

### **Tuần 7: Cơ chế Attention & Transformer**
- **Cơ chế Attention:**
  - Tại sao cần Attention?
  - Một số hàm Attention cơ bản.
  - Ứng dụng Attention trong dịch máy.

- **Transformer:**
  - Cơ chế Self-attention.
  - Self-attention đa đầu (Multi-head Self-Attention).
  - Kiến trúc Transformer: Encoder-Decoder.

### **Tuần 8: Tổng kết & Dự án cuối khóa**
- **Buổi 1:** Ôn tập và hệ thống kiến thức.
- **Buổi 2:** Bài giảng từ khách mời (Guest Lecture).
- **Dự án cuối khóa:** Xây dựng mô hình tạo chú thích ảnh (Image Captioning).

---
Khóa học này được thiết kế để cung cấp nền tảng vững chắc về Deep Learning và thực hành với các bài toán thực tế. Học viên sẽ có cơ hội làm việc với PyTorch và triển khai các mô hình tiên tiến. 🚀

