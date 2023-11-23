import mysql.connector
from tkinter import Tk, Label, Entry, Button, Listbox, Scrollbar, messagebox

class DatabaseApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Database Navigation App")

        # Database connection
        self.db = mysql.connector.connect(
            host="localhost",
            user="root",
            password="pass@2023",
            database="employeesdb"
        )
        self.cursor = self.db.cursor()

        # GUI elements
        self.label = Label(root, text="Enter Employee Name:")
        self.label.grid(row=0, column=0, padx=10, pady=10)

        self.entry = Entry(root)
        self.entry.grid(row=0, column=1, padx=10, pady=10)

        self.add_button = Button(root, text="Add", command=self.add_employee)
        self.add_button.grid(row=0, column=2, padx=10, pady=10)

        self.listbox = Listbox(root, height=10, width=40)
        self.listbox.grid(row=1, column=0, columnspan=3, padx=10, pady=10)

        self.scrollbar = Scrollbar(root)
        self.scrollbar.grid(row=1, column=3, sticky="ns")

        # Attach scrollbar to listbox
        self.listbox.config(yscrollcommand=self.scrollbar.set)
        self.scrollbar.config(command=self.listbox.yview)

        self.populate_listbox()
        self.listbox.bind('<<ListboxSelect>>', self.on_select)

        self.edit_button = Button(root, text="Edit", command=self.edit_employee)
        self.edit_button.grid(row=2, column=0, padx=10, pady=10)

        self.delete_button = Button(root, text="Delete", command=self.delete_employee)
        self.delete_button.grid(row=2, column=1, padx=10, pady=10)

    def add_employee(self):
        name = self.entry.get()
        if name:
            try:
                self.cursor.execute("INSERT INTO employees (name) VALUES (%s)", (name,))
                self.db.commit()
                self.entry.delete(0, 'end')
                self.populate_listbox()
            except mysql.connector.Error as err:
                messagebox.showerror("Error", f"Error: {err}")

    def populate_listbox(self):
        self.listbox.delete(0, 'end')
        self.cursor.execute("SELECT name FROM employees")
        data = self.cursor.fetchall()
        for item in data:
            self.listbox.insert('end', item[0])

    def on_select(self, event):
        selected_index = self.listbox.curselection()
        if selected_index:
            selected_item = self.listbox.get(selected_index)
            self.entry.delete(0, 'end')
            self.entry.insert('end', selected_item)

    def edit_employee(self):
        selected_index = self.listbox.curselection()
        if selected_index:
            new_name = self.entry.get()
            selected_item = self.listbox.get(selected_index)

            try:
                self.cursor.execute("UPDATE employees SET name = %s WHERE name = %s",
                                    (new_name, selected_item))
                self.db.commit()
                self.populate_listbox()
            except mysql.connector.Error as err:
                messagebox.showerror("Error", f"Error: {err}")

    def delete_employee(self):
        selected_index = self.listbox.curselection()
        if selected_index:
            selected_item = self.listbox.get(selected_index)

            try:
                self.cursor.execute("DELETE FROM employees WHERE name = %s", (selected_item,))
                self.db.commit()
                self.populate_listbox()
            except mysql.connector.Error as err:
                messagebox.showerror("Error", f"Error: {err}")

if __name__ == "__main__":
    root = Tk()
    app = DatabaseApp(root)
    root.mainloop()


-- Create a new database
CREATE DATABASE IF NOT EXISTS employeesdb;

-- Switch to the newly created database
USE employeesdb;

-- Create a table within the database
CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Sample data insertion (optional)
INSERT INTO employees (name) VALUES ('John Doe');
INSERT INTO employees (name) VALUES ('Jane Doe');
