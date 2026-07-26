from tkinter import *
import random

class Quiz:
    def __init__(self, master, questions):
        self.master = master
        self.questions = questions
        self.question_num = 0
        self.score = 0

        # Create GUI elements
        self.label = Label(self.master, text="")
        self.label.pack()
        self.entry = Entry(self.master)
        self.entry.pack()
        self.submit_button = Button(self.master, text="Submit", command=self.check_answer)
        self.submit_button.pack()

        # Display the first question
        self.display_question()

    def display_question(self):
        self.label.config(text=self.questions[self.question_num]['question'])
        self.entry.delete(0, END)

    def check_answer(self):
        user_answer = self.entry.get().strip().lower()
        correct_answer = self.questions[self.question_num]['answer'].lower()
        if user_answer == correct_answer:
            self.score += 1

        # Move to the next question
        self.question_num += 1
        if self.question_num < len(self.questions):
            self.display_question()
        else:
            self.show_score()

    def show_score(self):
        self.label.config(text="Your score: {}/{}".format(self.score, len(self.questions)))
        self.entry.destroy()
        self.submit_button.destroy()


# Example usage
questions = [
    {"question": "What is the capital of France?", "answer": "Paris"},
    {"question": "What is the largest planet in our solar system?", "answer": "Jupiter"},
    {"question": "Who invented the telephone?", "answer": "Alexander Graham Bell"},
    {"question": "What is the currency of Japan?", "answer": "Yen"},
]

root = Tk()
root.title("Quiz")
quiz = Quiz(root, questions)
root.mainloop()
