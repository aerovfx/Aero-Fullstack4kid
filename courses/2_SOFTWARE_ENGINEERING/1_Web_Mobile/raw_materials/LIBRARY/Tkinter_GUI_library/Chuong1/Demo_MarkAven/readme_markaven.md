Importing the module – Tkinter <br>
Create the main window (container) <br>
Add any number of widgets to the main window <br>
Apply the event Trigger on the widgets.<br>

Các bước thực hiện:<br>

The code starts by creating a new tkinter window.<br>
The title of the window is “MARKSHEET.” <br>
The geometry of the window is set to be 700×250 pixels.<br>
Next, four objects are created: an entry object for holding data, an e1 object for holding student information, an e2 object for holding teacher information, and an e3 object for holding test information.<br>
Each of these objects has a corresponding variable assigned to it.<br>
For example, the entry object has a variable named e1 .<br>
This variable stores the data entered into the window.<br>
Similarly, each of the other objects also has a corresponding variable.<br>
For example, the e2 object stores student information, and its corresponding variable is named s1 .<br>
The same goes for the other variables in each of these objects.<br>
Now that all of the variables have been initialized, some code is executed to create buttons and labels onscreen.<br>
A button named btnStart is created and given a label of “Start.”<br>
A label called lblMarkName is also created and given a text value of “Mark Sheet.”
Finally, two labels are created: one called lblStudentName and another called lblTeacherName .<br>
These labels will display<br>
The code creates a new tkinter window and assigns it the title “MARKSHEET”.<br>
The geometry for the window is set to be 700×250.<br>
Next, four objects are created which will be used to store data in the GUI.,br
These objects are named e1, e2, e3, and e4.<br>
Finally, seven entries are created in each of these objects which will hold data about the students in the class.<br>
The code starts by storing a variable, tot, to hold the total number of credits for each grade.<br>
The code then loops through each of the grades in the data set and calculates the total number of credits for that grade.<br>
For grades A, B, and C, the code adds 40, 36, and 32 respectively to tot.<br>
For grades D and P, the code adds 24 and 28 respectively to tot.<br>
Finally, for grades F and G (which have no subject credit), tot is set to 0.<br>
The next part of the code sets up labels for each column in a table-like structure called a grid.<br>
The labels are created using tk.Label() function calls with appropriate text values assigned as arguments.<br>
The grid() method places these labels at respective positions in the table using row=row number/column=column number coordinates (e.g., tk.Label(master,”40″) will be placed at position (4, 4) in the table).<br>
When all of the labels have been created, Tot is incremented by 40 for grades A-D and by 36 for grades E-P. Next, if e5 is equal to “A”, “B”, or “C”, then instead<br>
The code displays the total subject credits and SGPA according to grades entered.
The code starts by storing the total marks in a variable called tot.<br>
Next, it calculates the total credits for grade A by adding 40 to tot.<br>
Similarly, it calculates the total credits for grade B, 36, and so on.<br>
When it comes to grades below A, the code uses grid() method to place the widgets at respective positions in a table like structure.<br>
For grades above A, there is no need to use grid() method as all marks are displayed in one line.<br>
The last part of the code checks if any of the variables e5, e6 have values that match those of “A”.<br>
If they do, then the corresponding label is<br>
The code starts with a few basic labels for the different parts of the user interface.<br>
The first label is “master”.<br>
This is the main window that contains all of the other labels and controls.<br>
Next, there are three labels for grades: CS 201, CS 202, and MA 201.<br>
These labels will show the student’s current grade in each course.<br>
The next set of labels shows subject credits: Sub Credit, 4, 4, and 3.<br>
These labels will show how many credit hours have been earned in each subject area.<br>
Note that these values are rounded to two decimal places (e.g., Sub Credit = .5).<br>
Finally, there are four labels for credit obtained: Credit obtained, 1/2 Credit obtained, 3/4 Credit obtained, and Full Credit obtained.<br>
These labels will show how much credit has been earned in each subject area so far (rounded to two decimal places).<br>
The code creates a grid with six rows and six columns.<br>
The first row contains three labels: CS 201, CS 202, and MA 201.<br>
The second row contains four labels: EC 201, Grade, Sub Credit, and Credit obtained.<br>
The third row contains two labels: 4 and 3.<br>
The fourth row contains one label: 4.<br>
The fifth row contains one label: 3.<br>
The sixth row has no labels.<br>
The code also creates a grid with six rows and six columns that displays the grades for the subject credits in alphabetical order.<br>