
# **1. Markov Decision Process (MDP)**  
**Vai trò**: Là nền tảng toán học của RL, mô hình hóa môi trường thành các **trạng thái (states)**, **hành động (actions)**, **phần thưởng (rewards)**, và **xác suất chuyển trạng thái (transition probabilities)**.  
- **Thành phần**:  
  - $ S $: Tập trạng thái.  
  - \( A \): Tập hành động.  
  - \( P(s'|s, a) \): Xác suất chuyển từ trạng thái \( s \) sang \( s' \) khi thực hiện hành động \( a \).  
  - \( R(s, a, s') \): Phần thưởng nhận được.  
  - \( \gamma \): Hệ số chiết khấu (discount factor).  
- **Mục tiêu**: Tìm **policy** \( \pi(a|s) \) tối ưu để tối đa tổng phần thưởng kỳ vọng \( \mathbb{E}[\sum \gamma^t R_t] \).


# **2. Dynamic Programming (DP)**  
**Vai trò**: Giải MDP khi biết **đầy đủ mô hình môi trường** (biết \( P \) và \( R \)).  
- **Phương pháp**:  
  - **Policy Iteration**:  
    1. **Policy Evaluation**: Tính giá trị \( V^\pi(s) \) của policy hiện tại.  
    2. **Policy Improvement**: Cập nhật policy để greedy theo \( V^\pi \).  
  - **Value Iteration**: Trực tiếp tối ưu giá trị \( V^*(s) \) bằng cách lặp công thức Bellman.  
- **Ưu điểm**: Đảm bảo hội tụ.  
- **Nhược điểm**: Chỉ áp dụng được cho không gian trạng thái nhỏ (do độ phức tạp \( O(|S|^2|A|) \)).  

---

# **3. Monte Carlo (MC) Methods**  
**Vai trò**: Ước lượng giá trị \( V(s) \) hoặc \( Q(s, a) \) bằng cách **lấy mẫu toàn bộ tập kết (episode)**.  
- **Đặc điểm**:  
  - **Model-free**: Không cần biết \( P \) và \( R \).  
  - **Chỉ áp dụng cho episodic tasks** (có điểm kết thúc).  
  - **High variance** do phụ thuộc vào một trajectory cụ thể.  
- **Ví dụ**:  
  - **MC Prediction**: Ước lượng \( V^\pi \) bằng trung bình phần thưởng tích lũy.  
  - **MC Control**: Cải thiện policy dựa trên Q-values (e.g., ε-greedy).  

---

# **4. Temporal Difference (TD) Methods**  
**Vai trò**: Kết hợp ý tưởng của DP và MC, cập nhật giá trị **từng bước (online)** thay vì đợi kết thúc episode.  
- **Phương pháp**:  
  - **TD(0)**: Cập nhật \( V(s) \leftarrow V(s) + \alpha [R + \gamma V(s') - V(s)] \).  
  - **SARSA (On-policy)**: Cập nhật Q-value dựa trên \( (s, a, r, s', a') \).  
  - **Q-Learning (Off-policy)**: Cập nhật Q-value dựa trên \( \max_{a'} Q(s', a') \).  
- **Ưu điểm**: Hiệu quả hơn MC (giảm variance), áp dụng cho non-episodic tasks.  

---

# **5. N-step Bootstrapping**  
**Vai trò**: Cân bằng giữa TD (1-step) và MC (full-step) bằng cách sử dụng **n bước thực tế** trước khi bootstrap.  
- **Công thức**:  
  - \( G_t^{(n)} = R_{t+1} + \gamma R_{t+2} + \dots + \gamma^{n-1} R_{t+n} + \gamma^n V(s_{t+n}) \).  
- **Ví dụ**:  
  - **TD(λ)**: Tổng hợp các n-step returns với trọng số \( \lambda \).  

---

# **6. Continuous State Spaces**  
**Thách thức**: Không thể dùng bảng Q-table do số chiều vô hạn.  
- **Giải pháp**:  
  - **Function Approximation**: Xấp xỉ \( Q(s, a) \) hoặc \( V(s) \) bằng hàm tuyến tính, kernel methods, hoặc neural networks.  
  - **Tile Coding**: Chia không gian liên tục thành các vùng rời rạc.  
  - **Deep RL**: Dùng neural networks để xử lý state liên tục (e.g., DQN).  

---

# **7. Brief Introduction to Neural Networks**  
**Vai trò**: Làm function approximator cho RL trong không gian phức tạp.  
- **Cấu trúc**:  
  - Input layer (biểu diễn state).  
  - Hidden layers (trích xuất đặc trưng).  
  - Output layer (dự đoán Q-values hoặc policy).  
- **Loss Function**: Mean Squared Error (cho value-based methods) hoặc Policy Gradient (cho policy-based methods).  

---

# **8. Deep SARSA**  
**Vai trò**: Kết hợp SARSA với neural networks để xử lý không gian lớn.  
- **Cơ chế**:  
  - Dùng neural network để xấp xỉ \( Q(s, a; \theta) \).  
  - Cập nhật trọng số \( \theta \) bằng gradient descent trên loss \( (Q(s, a) - (r + \gamma Q(s', a'; \theta)))^2 \).  
- **Ưu điểm**: Hiệu quả với state liên tục, nhưng dễ bị **non-stationarity** (do target phụ thuộc vào policy đang thay đổi).  

---

# **9. Deep Q-Learning (DQN)**  
**Vai trò**: Phiên bản off-policy của Deep SARSA, tối ưu hóa Q-values bằng cách tách **target network** và **experience replay**.  
- **Cải tiến**:  
  - **Target Network**: Dùng network riêng để tính \( \max_{a'} Q(s', a'; \theta^-) \), giảm instability.  
  - **Experience Replay**: Lưu trữ transitions vào buffer và lấy mẫu ngẫu nhiên để huấn luyện.  
- **Ví dụ**: Thành công trong Atari games với raw pixels làm input.  

---

# **10. REINFORCE**  
**Vai trò**: Policy gradient method cơ bản, tối ưu policy trực tiếp bằng cách **tăng xác suất các hành động mang lại phần thưởng cao**.  
- **Công thức**:  
  - \( \nabla J(\theta) \approx \mathbb{E}[\sum_t \nabla_\theta \log \pi(a_t|s_t; \theta) G_t] \).  
- **Đặc điểm**:  
  - **High variance** do sử dụng Monte Carlo returns \( G_t \).  
  - Không cần value function (chỉ policy network).  

---

# **11. Advantage Actor-Critic (A2C)**  
**Vai trò**: Kết hợp policy gradient (Actor) và value function (Critic) để giảm variance.  
- **Cơ chế**:  
  - **Actor**: Cập nhật policy \( \pi(a|s; \theta) \).  
  - **Critic**: Ước lượng value function \( V(s; \phi) \) để tính **advantage** \( A(s, a) = Q(s, a) - V(s) \).  
- **Công thức cập nhật**:  
  - \( \nabla J(\theta) \approx \mathbb{E} [\nabla_\theta \log \pi(a|s; \theta) \cdot A(s,a) ] \)  
- **Ưu điểm**: Hiệu quả hơn REINFORCE nhờ advantage function.  

---

# **Phân tích quá trình huấn luyện RL**  
1. **Khởi tạo**:  
   - Thiết kế MDP phù hợp với bài toán (xác định states, actions, rewards).  
   - Chọn phương pháp (value-based, policy-based, hoặc hybrid).  

2. **Thu thập dữ liệu**:  
   - Agent tương tác với môi trường, lưu transitions vào replay buffer (với DQN/A2C).  

3. **Cập nhật mô hình**:  
   - **Value-based methods** (DQN): Tối ưu Q-values để policy implicit (e.g., ε-greedy).  
   - **Policy-based methods** (REINFORCE): Tối ưu trực tiếp policy network.  
   - **Actor-Critic** (A2C): Kết hợp cả hai, dùng Critic để hướng dẫn Actor.  

4. **Đánh giá và điều chỉnh**:  
   - Giám sát phần thưởng tích lũy, độ ổn định của loss.  
   - Điều chỉnh hyperparameters (learning rate, γ, exploration rate).  

5. **Triển khai**:  
   - Sử dụng policy tối ưu (greedy hoặc stochastic) để ra quyết định.  

---

# **So sánh phương pháp**  
| **Phương pháp**       | **Ưu điểm**                          | **Nhược điểm**                      |  
|------------------------|---------------------------------------|--------------------------------------|  
| **Dynamic Programming** | Đảm bảo hội tụ, chính xác            | Yêu cầu biết mô hình môi trường      |  
| **Monte Carlo**         | Đơn giản, không cần model            | High variance, chỉ episodic tasks   |  
| **TD Learning**         | Hiệu quả, áp dụng online              | Bias do bootstrap                   |  
| **Deep Q-Learning**     | Xử lý state liên tục, hiệu suất cao   | Instability, overestimation bias    |  
| **A2C**                 | Giảm variance, linh hoạt              | Phức tạp, cần tune cả Actor và Critic |  

---

# **Kết luận**  
Quá trình huấn luyện RL phụ thuộc vào việc lựa chọn phương pháp phù hợp với đặc thù bài toán (không gian state/action, tính chất môi trường). Sự kết hợp giữa **lý thuyết MDP**, **function approximation** (neural networks), và **kỹ thuật giảm variance** (như Actor-Critic) là chìa khóa để giải quyết các bài toán thực tế phức tạp.

