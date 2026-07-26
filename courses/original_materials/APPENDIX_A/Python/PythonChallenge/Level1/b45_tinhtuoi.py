#Tính tuổi dựa trên ngày tháng năm sinh nhập vào.
import datetime

print("Mời bạn vui lòng nhập ngày tháng năm sinh để tính tuổi")
birth_day = int(input("Ngày sinh:"))
birth_month = int(input("Tháng sinh:"))
birth_year = int(input("Năm sinh:"))

current_year = datetime.date.today().year
current_month = datetime.date.today().month
current_day = datetime.date.today().day

age_year = current_year - birth_year
age_month = abs(current_month-birth_month)
age_day = abs(current_day-birth_day)

print("### Tuổi của bạn chính xác là:### \n", age_year, " tuổi ", age_month, " tháng và ", age_day, " ngày")