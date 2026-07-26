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


# Example usage
questions = [
    {"question": "What is the capital of France?", "choices": ["Paris", "London", "Berlin", "Rome"], "answer": "Paris"},
    {"question": "What is the largest planet in our solar system?", "choices": ["Jupiter", "Saturn", "Mars", "Neptune"], "answer": "Jupiter"},
    {"question": "Who invented the telephone?", "choices": ["Thomas Edison", "Alexander Graham Bell", "Nikola Tesla", "Henry Ford"], "answer": "Alexander Graham Bell"},
    {"question": "What is the currency of Japan?", "choices": ["Yuan", "Yen", "Won", "Baht"], "answer": "Yen"},
]

root = Tk()
root.title("Quiz")
quiz = Quiz(root, questions)
root.mainloop()
