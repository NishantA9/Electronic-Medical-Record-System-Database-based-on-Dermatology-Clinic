==========================================================================================================================================================================================
									Dermatology Database System Readme
==========================================================================================================================================================================================

ITIS 6120/8120, Applied Databases


Group Members: (Group P)
Anushka Santosh Padyal – 801379909
Nishant Acharekar – 801363902
Shivangi Saxena – 801372350
Bulbul Roy – 801365911

==========================================================================================================================================================================================

Instructions to Run the project are as follows: (MySQL Workbench) with Python and Jupyter Notebook setup with User Management instructions:

1. Install Python from here: https://www.python.org/downloads/

2. Now install the Jupyter Notebook from here: https://jupyter.org/install
   or else once python is installed, Open the command prompt and run it as Administrator.

3. Now type the following commands in the command prompt:
	pip install jupyterlab
	pip install notebook

4. Once the installation is done, we need to establish database connectivity with our programming interface and install the 'MySQL Connector' in the same command prompt.
	pip install mysql-connector-python

5. Now install MySQL Workbench using the link: https://dev.mysql.com/downloads/workbench/

6. After completing the installation create a  MySQL connection. Detailed steps are mentioned in this blog: 
	https://dev.mysql.com/doc/workbench/en/wb-getting-started-tutorial-create-connection.html

7. Once the connection is created, Open the created MySQL connection >> Connect to the MySQL server providing the password that you used while setting up the MySQL connection >> Click on the ‘File’ tab >> Click on the ‘Open SQL Script…’ >> Now locate to the project working directory to open and execute the SQL scripts one by one in a sequence shown below:

	a) Run the proj_dermatC_db.sql script file for creating the database tables.
	b) Run the proj_Triggers.sql file which contains triggers.
	c) Run proj_stored_procedures.sql file which contains queries for stored procedures.
	d) Run proj_insert_dermatC_db.sql which contains sample data that can be inserted into tables.
	e) Run proj_dermatC_UserProfiles_db.sql to create the users and share them among the staff based on their position.
	f) Run proj_dermatC_MainTestScripts_db.sql file is used to check the supporting functionality of the database

8. After running the SQL scripts we need to implement user authentication and user role access management. click on the ‘Server’ tab >> click on the ‘Users and Privileges’. Select the user and set the password.
	In my system, the users and their respective credentials are as follows(refer to an example):
	(username/password):
	admin_staff/P@ssw0rd@1234
	test&technical_staff/Test1234!
	doctor_staff/Test1234!
	receptionist_staff/Test1234!
	nursing_staff/Test1234!

9. Once the passwords are set, We need to run the project. Now to run the project open the project folder and copy the path of the folder which contains all the project files. Here is the example below (don't use the below directory):
	Open Command Prompt as administrator
	Type "cd C:\Users\firee\OneDrive\Desktop\Personal\SEM2\Applied DB\AppliedDB Project\GroupP\ProjectFiles" and press enter.
	Once you are inside the folder directory. 
	Type: "jupyter notebook"

10. Once Jupyter is opened, select the 'finalprojectAppliedDatabase.ipynb' file and then click 'open'. Then you will see a small 'play' button, click that to run the program. 

11. You can also refer the following doc file for a detailed explanation of each step. 


==========================================================================================================================================================================================
