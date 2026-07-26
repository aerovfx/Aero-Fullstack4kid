from tkinter import *
import random

class Quiz:
    def __init__(self, master, questions):
        self.master = master
        self.questions = questions
        self.question_num = 0
        self.score = 0
        self.choices = []

        # Create GUI elements
        self.question_label = Label(self.master, text="")
        self.question_label.pack()

        self.choices_frame = Frame(self.master)
        self.choices_frame.pack()

        self.submit_button = Button(self.master, text="Submit", command=self.check_answer)
        self.submit_button.pack()

        self.add_button = Button(self.master, text="Add Question", command=self.add_question)
        self.add_button.pack()

        # Display the first question
        self.display_question()

    def display_question(self):
        # Clear any existing choices
        for choice in self.choices:
            choice.destroy()
        self.choices = []

        # Display the question
        question = self.questions[self.question_num]
        self.question_label.config(text=question['question'])

        # Display the choices
        choices = question['choices']
        random.shuffle(choices)
        for choice in choices:
            choice_button = Radiobutton(self.choices_frame, text=choice, value=choice, variable=StringVar())
            choice_button.pack(anchor=W)
            self.choices.append(choice_button)

    def check_answer(self):
        # Check if the selected choice is correct
        selected_choice = None
        for choice in self.choices:
            if choice.winfo_ismapped() and choice.winfo_exists():
                if choice['value'] == self.questions[self.question_num]['answer']:
                    selected_choice = choice
                    self.score += 1
                break

        # Disable all choices
        for choice in self.choices:
            choice.config(state=DISABLED)

        # Move to the next question
        self.question_num += 1
        if self.question_num < len(self.questions):
            self.display_question()
        else:
            self.show_score()

    def show_score(self):
        self.question_label.config(text="Your score: {}/{}".format(self.score, len(self.questions)))
        self.choices_frame.destroy()
        self.submit_button.destroy()

    def add_question(self):
        add_window = Toplevel(self.master)
        add_window.title("Add Question")

        question_label = Label(add_window, text="Question:")
        question_label.pack()

        question_entry = Entry(add_window)
        question_entry.pack()

        choices_label = Label(add_window, text="Choices (separated by commas):")
        choices_label.pack()

        choices_entry = Entry(add_window)
        choices_entry.pack()

        answer_label = Label(add_window, text="Answer:")
        answer_label.pack()

        answer_entry = Entry(add_window)
        answer_entry.pack()

        add_button = Button(add_window, text="Add", command=lambda: self.add_new_question(question_entry.get(), choices_entry.get(), answer_entry.get()))
        add_button.pack()

    def add_new_question(self, question, choices, answer):
        new_question = {"question": question, "choices": choices.split(","), "answer": answer}
        self.questions.append(new_question)
        messagebox.showinfo("Success", "Question added!")
        self.master.focus_set()

# Example usage
questions = [
    {"question": "Thủ đô của Việt Nam là?", "choices": ["Hải Phòng", "Vũng Tàu", "Huế", "Hà Nội"], "answer": "Hà Nội"},
    {"question": "Phương tiện gì thông dụng nhất ở Việt Nam?", "choices": ["Xe đạp", "Ô tô", "Xe máy", "Tàu thuỷ"], "answer": "Xe máy"},
   
]

root = Tk()
root.title("Quiz")
quiz = Quiz(root, questions)
root.mainloop()