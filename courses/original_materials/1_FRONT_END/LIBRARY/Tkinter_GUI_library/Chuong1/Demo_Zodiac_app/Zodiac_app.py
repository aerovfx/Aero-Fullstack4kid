from tkinter import *
from tkcalendar import Calendar
from datetime import datetime

#pip install tkcalendar before run program 
#Nếu còn lỗi thì tạo môi trường chạy cho app: python -m venv myenv 
# Sau đó active: source đường dẫn file activate

root = Tk()
root.title("Cung Hoàng Đạo: Zodiac App")
root.geometry("800x450")

# Define function to determine Zodiac based on date
def get_zodiac(month, day):
    if month == 1:
        if day <= 19:
            return "Capricorn: Cung Ma Kết. Bạn chăm chỉ, sâu sắc và đầy quyết đoán. Sao Thổ chiếu mệnh"
        else:
            return "Aquarius: Cung Bảo Bình. Bạn giỏi sắp xếp, yêu tự do và đam mê khám phá. Chịu ảnh hưởng bởi sao Thiên Vươn"
    elif month == 2:
        if day <= 18:
            return "Aquarius: Cung Bảo Bình. Bạn sáng tạo, dễ tha thứ. Chịu ảnh hưởng bởi sao Vệ nữ"
        else:
            return "Pisces: Cung Song Ngư. Bạn truyền cảm hứng, đặt nặng tình yêu trong cuộc sống. Chịu ảnh hưởng bởi sao Hải Vương"
    elif month == 3:
        if day <= 20:
            return "Pisces: Cung Song Ngư. Bạn khôn ngoan, chung thủy và yêu mãnh liệt, trực giác tốt. Chịu ảnh hưởng bởi sao Diêm Vương"
        else:
            return "Aries: Cung Bạch Dương. Bạn nhiệt huyết, quyết đoán. Chịu ảnh hưởng bởi sao Hỏa"
    elif month == 4:
        if day <= 19:
            return "Aries: Cung Bạch Dương. Bạn minh bạch, chủ nghĩa cá nhân. Chịu ảnh hưởng bởi sao Mộc"
        else:
            return "Taurus: Cung Kim Ngưu. Bạn kiên định. Chịu ảnh hưởng bởi sao Vệ Nữ"
    elif month == 5:
        if day <= 20:
            return "Taurus: Cung Kim Ngưu. Bạn có kỷ luật và kiên định. Chịu ảnh hưởng bởi sao Thủy"
        else:
            return "Gemini: Cung Song Tử. Bạn thông minh, đa nhân cách, dễ thích nghi. Chịu ảnh hưởng bởi sao Thủy"
    elif month == 6:
        if day <= 20:
            return "Gemini: Cung Song Tử. Bạn thích lắng nghe, chia sẻ, tận hưởng thế giới riêng mình. Chịu ảnh hưởng bởi Mặt Trăng"
        else:
            return "Cancer: Cự Giải. Bạn yêu gia đình, nhạy cảm và tế nhị. Chịu ảnh hưởng bởi Mặt Trăng"
    elif month == 7:
        if day <= 22:
            return "Cancer: Cung Cự Giải. Bạn có sự cảm thông, mong muốn yêu và được yêu. Chịu ảnh hưởng bởi sao Thái Âm và Mộc"
        else:
            return "Leo: Cung Sư tử. Bạn có cái tôi cao, hào phóng. Chịu ảnh hưởng bởi Mặt Trời"
    elif month == 8:
        if day <= 22:
            return "Leo: Cung Sư tử. Bạn tham vọng, có năng khiếu về kiến trúc, nghệ thuật. Chịu ảnh hưởng bởi sao Hỏa"
        else:
            return "Virgo: Cung Xử Nữ. Bạn thích sự hoàn hảo, thông minh, logic. Chịu ảnh hưởng bởi sao Thủy"
    elif month == 9:
        if day <= 22:
            return "Virgo: Cung Xử Nữ. Bạn yêu thương gia đình, thấu hiểu. Chịu ảnh hưởng bởi sao Vệ Nữ"
        else:
            return "Libra: Cung Thiên Bình. Bạn giỏi giao tiếp, lãng mạn. Chịu ảnh hưởng từ sao Vệ nữ"
    elif month == 10:
        if day <= 22:
            return "Libra: Cung Thiên Bình. Bạn dí dỏm, hài hước và linh hoạt. Chịu ảnh hưởng bởi sao Thủy"
        else:
            return "Scorpio: Cung Bọ Cạp. Bạn có sức hút và lòng trắc ẩn. Chịu ảnh hưởng bởi sao Diêm Vương"
    elif month == 11:
        if day <= 21:
            return "Scorpio: Cung Bọ Cạp. Bạn quyến rũ, dễ thích ứng, giỏi nội trợ. Chịu ảnh hưởng bởi Mặt Trăng"
        else:
            return "Sagittarius: Cung Nhân Mã. Bạn ham học hỏi, lạc quan, tự do. Chịu ảnh hưởng bởi sao Mộc "
    else:
        if day <= 21:
            return "Sagittarius: Cung Nhân Mã. Bạn yêu nghệ thuật, tham vọng. Chịu ảnh hưởng bởi Mặt Trời"
        else:
            return "Capricorn: Cung Ma Kết. Bạn đam mê nghệ thuật, chung thủy. Sao Vệ Nữ quản chiếu"

# Define function to get date from calendar widget
def get_date():
    date_label.config(text=cal.selection_get())
    date = cal.selection_get()
    month = date.month
    day = date.day
    zodiac = get_zodiac(month, day)
    zodiac_label.config(text=f"Cung Hoàng Đạo của bạn là {zodiac}")

# Create calendar widget
cal = Calendar(root, selectmode="day", year=2022, month=1, day=1)
cal.pack(pady=20)

# Create button to get selected date
date_btn = Button(root, text="Nhận kết quả", command=get_date)
date_btn.pack(pady=10)

# Create label to display selected date
date_label = Label(root, text="")
date_label.pack(pady=10)

# Create label to display Zodiac sign
zodiac_label = Label(root, text="")
zodiac_label.pack(pady=10)

root.mainloop()
