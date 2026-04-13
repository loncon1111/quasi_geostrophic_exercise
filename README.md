# quasi_geostrophic_exercise

# Bài tập: Phân tích các trường động lực học tại mực 500 hPa
## 1. Thông số ban đầu
* **Trường địa thế vị ($\Phi$):**
$$\Phi(x, y, t) = 5.5 \times 10^4 - U_0 f_0 y + V f_0 k^{-1} \sin[k(x-ct)] \cos(ly)$$
* **Hằng số:**
  * $U_0 = 30 \, \text{m/s}$,
  * $f_0 = 1.0 \times 10^{-4} \, \text{s}^{-1}$
  * $V = 25 \, \text{m/s}$,
  * $c = 25 \, \text{m/s}$
  * Số sóng: $k = 2\pi / L_x$ và $l = 2\pi / L_y$
  * Kích thước đặc trưng: $L_x = 6 \times 10^6 \, \text{m}$ và $L_y = 4 \times 10^6 \, \text{m}$
  * Tham số Beta: $\beta = 1.67 \times 10^{-11} \, \text{m}^{-1}\text{s}^{-1}$
* **Miền tính:** $-3000 \, \text{km} \le x \le 3000 \, \text{km}$ và $-1000 \, \text{km} \le y \le 1000 \, \text{km}$.
* **Thời điểm khảo sát:** $t = 0$.
## 2. Các biểu thức toán học cần lập trình
### a. Trường địa thế vị (theo công thức)
### b. Thành phần gió địa chuyển ($u_g, v_g$)
Sử dụng công thức: $u_g = -\frac{1}{f_0} \frac{\partial \Phi}{\partial y}$ và $v_g = \frac{1}{f_0} \frac{\partial \Phi}{\partial x}$
$$u_g = U_0 + V \frac{l}{k} \sin(kx) \sin(ly)$$
$$v_g = V \cos(kx) \cos(ly)$$
