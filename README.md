# quasi_geostrophic_exercise

# Bài tập: Phân tích các trường động lực học tại mực 500 hPa
## 1. Thông số ban đầu
* **Trường địa thế vị ($\Phi$):**
$$\Phi(x, y, t) = 5.5 \times 10^4 - U_0 f_0 y + V f_0 k^{-1} [\sin(k(x-ct)) + \alpha \sin(2k(x-ct))] \cos(ly)$$
* **Hằng số:**
  * $U_0 = 30 \, \text{m/s}$,
  * $f_0 = 1.0 \times 10^{-4} \, \text{s}^{-1}$
  * $V = 25 \, \text{m/s}$,
  * $c = 20 \, \text{m/s}$
  * Số sóng: $k = 2\pi / L_x$ và $l = 2\pi / L_y$
  * Kích thước đặc trưng: $L_x = 6 \times 10^6 \, \text{m}$ và $L_y = 4 \times 10^6 \, \text{m}$
  * Tham số Beta: $\beta = 1.67 \times 10^{-11} \, \text{m}^{-1}\text{s}^{-1}$
  * Tham số hình dạng: Sinh viên thực hiện hai trường hợp: $\alpha =0.0$ (dạng elip) và $\alpha = 0.4$
* **Miền tính:** $-3000 \, \text{km} \le x \le 3000 \, \text{km}$ và $-1000 \, \text{km} \le y \le 1000 \, \text{km}$.
* **Thời gian khảo sát:** $N_t = 100$ và $\delta{t} = 60s$.
## 2. Các biểu thức toán học cần lập trình
### a. Trường địa thế vị (theo công thức)
### b. Thành phần gió địa chuyển ($u_g, v_g$)
Sử dụng công thức: $u_g = -\frac{1}{f_0} \frac{\partial \Phi}{\partial y}$ và $v_g = \frac{1}{f_0} \frac{\partial \Phi}{\partial x}$

$$u_g = U_0 + V \frac{l}{k} [\sin(k(x-ct)) + \alpha \sin(2k(x-ct))] \sin(ly)$$

$$v_g = V [\cos(k(x-ct)) + \alpha \cos(2k(x-ct))] \cos(ly)$$

### c. Độ xoáy tương đối địa chuyển ($\zeta_g$)
Sử dụng công thức: $\zeta_g = \frac{\partial v_g}{\partial x} - \frac{\partial u_g}{\partial y}$

$$\zeta_g = -V [\left( k + \frac{l^2}{k} \right) \sin(k(x-ct)) + \left( 4k + \frac{\alpha l^2}{k} \right) \sin(2k(x-ct)) ] \cos(ly)$$


## 3. Yêu cầu sản phẩm

<img width="1024" height="559" alt="image" src="https://github.com/user-attachments/assets/e758c364-b2a5-40e1-8cd8-6ae4feb1156b" />



### Mã nguồn: 
Viết bằng Fortran, tính toán các trường $\Phi , u, v, \zeta_g$ tại mỗi bước thời gian, xuất dữ liệu ra định dạng binary trực tiếp (access='direct').

### Tệp điều khiển (.ctl): 
Để GrADS có thể đọc và hiển thị 4 biến: $\Phi$ (địa thế vị), u (gió đông-tây), v (gió nam-bắc), $\zeta_g$ (độ xoáy).

### Phân tích hình ảnh:
- Vẽ bản đồ shaded cho $\Phi$. So sánh 2 trường hợp $\alpha = 0.0$ và $\alpha = 0.4$
- Dùng lệnh `hcurl(u,v)` của GrADS để kiểm chứng lại biến $\zeta_g$ tính từ Fortran
