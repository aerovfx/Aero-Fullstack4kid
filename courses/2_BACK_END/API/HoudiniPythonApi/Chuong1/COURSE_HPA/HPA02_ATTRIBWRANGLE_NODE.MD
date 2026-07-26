// Khai báo màu đỏ và màu xanh lá cây
vector red = {1.0, 0.0, 0.0};
vector green = {0.0, 1.0, 0.0};

// Thêm một thuộc tính "Cd" (Color) cho mỗi điểm trong geometry
int color_attrib = addpointattrib(geoself(), "Cd", red);

// Lặp qua từng điểm trong geometry
for (int i = 0; i < @numpt; i++)
{
    // Kiểm tra điểm có số thứ tự chẵn hay không
    if (i % 2 == 0)
    {
        // Nếu điểm có số thứ tự chẵn, gán giá trị màu xanh lá cây cho thuộc tính "Cd"
        vector Cd = green;
        setpointattrib(geoself(), "Cd", i, Cd);
    }
}
