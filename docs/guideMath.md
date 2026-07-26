Dưới đây là một số quy tắc cơ bản để viết các ký hiệu toán học trong Markdown sử dụng LaTeX:

### 1. **Công thức toán học trong dòng (Inline Math)**

Sử dụng dấu đô la (`$`) để bao quanh công thức toán học nếu bạn muốn hiển thị công thức trong cùng một dòng văn bản.

**Ví dụ:**
```markdown
Đây là công thức $E = mc^2$ trong dòng văn bản.
```
Kết quả hiển thị sẽ là:
Đây là công thức $ \( E = mc^2 \) $ trong dòng văn bản.

### 2. **Công thức toán học dạng khối (Block Math)**

Để viết công thức toán học dạng khối (ở giữa trang, tách biệt với văn bản), sử dụng dấu đô la kép (`$$`).

**Ví dụ:**
```markdown
$$
\nabla J(\theta)
$$
```
Kết quả hiển thị sẽ là:
\[
\nabla J(\theta)
\]

### 3. **Công thức với phân số**

Để viết phân số, sử dụng cú pháp `\frac{numerator}{denominator}`.

**Ví dụ:**
```markdown
Công thức phân số là: $\frac{a}{b}$
```
Kết quả hiển thị sẽ là:
$$
\frac{a}{b}
$$

### 4. **Công thức với căn bậc hai**

Để viết căn bậc hai, sử dụng cú pháp `\sqrt{expression}`.

**Ví dụ:**
```markdown
Công thức căn bậc hai là: $\sqrt{a + b}$
```
Kết quả hiển thị sẽ là:
$$
\sqrt{a + b}
$$

### 5. **Lũy thừa và chỉ số**

Để viết lũy thừa hoặc chỉ số, sử dụng dấu `^` và `_`.

- **Lũy thừa**: `a^b` 
- **Chỉ số**: `a_b`

**Ví dụ:**
```markdown
Lũy thừa là: $x^2$, chỉ số là: $a_b$
```
Kết quả hiển thị sẽ là:
$$
x^2, \quad a_b
$$

### 6. **Tích phân (Integral)**

Để viết tích phân, sử dụng cú pháp `\int`:

**Ví dụ:**
```markdown
Tích phân là: $\int_{0}^{\infty} e^{-x^2} dx$
```
Kết quả hiển thị sẽ là:
$$
\int_{0}^{\infty} e^{-x^2} dx
$$

### 7. **Dấu delta (Δ) và nabla (∇)**

Sử dụng cú pháp `\Delta` cho Delta và `\nabla` cho Nabla.

**Ví dụ:**
```markdown
Dấu Delta là: $\Delta x$, Dấu Nabla là: $\nabla f(x)$
```
Kết quả hiển thị sẽ là:
$$
\Delta x, \quad \nabla f(x)
$$

### 8. **Vecto và ma trận**

Để viết vector hoặc ma trận, sử dụng cú pháp `\mathbf{v}` cho vector và `\begin{matrix} ... \end{matrix}` cho ma trận.

**Ví dụ:**
```markdown
Vector: $\mathbf{v}$, Ma trận: $\begin{matrix} a & b \\ c & d \end{matrix}$
```
Kết quả hiển thị sẽ là:
$$
\mathbf{v}, \quad \begin{matrix} a & b \\ c & d \end{matrix}
$$

### 9. **Ký hiệu trong logic toán học**

Sử dụng cú pháp `\forall` cho "với mọi", `\exists` cho "tồn tại", `\implies` cho "suy ra", `\neg` cho "phủ định".

**Ví dụ:**
```markdown
Logic: $\forall x \in \mathbb{R}, \exists y \in \mathbb{R}$, $\neg P \implies Q$
```
Kết quả hiển thị sẽ là:
$$
\forall x \in \mathbb{R}, \exists y \in \mathbb{R}, \quad \neg P \implies Q
$$

### 10. **Ký hiệu toán học khác**

- **Hàm số**: `\sin`, `\cos`, `\tan`, `\log`, `\exp`...
- **Mũi tên**: `\rightarrow`, `\leftarrow`, `\Rightarrow`
- **Hằng số**: `\pi`, `e`

**Ví dụ:**
```markdown
Hàm số: $\sin(x)$, Mũi tên: $x \rightarrow y$
```
Kết quả hiển thị sẽ là:
$$
\sin(x), \quad x \rightarrow y
$$

Những quy tắc này sẽ giúp bạn viết và hiển thị các công thức toán học đẹp mắt trong Markdown nếu nền tảng bạn sử dụng hỗ trợ LaTeX.
